From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 27 Oct 2019 23:44:26 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-10-24
In-Reply-To: <20191027225805.4e2c538d@windsurf.dhcp.lyon.intranet>
References: <20191025061750.1CDB387FC3@hemlock.osuosl.org>
 <20191026195327.6083a565@windsurf.home>
 <d3c68ac1-d14f-6b4e-5dc2-1f424c0412c3@benettiengineering.com>
 <20191027225805.4e2c538d@windsurf.dhcp.lyon.intranet>
Message-ID: <5e512f1a-aa12-a6c6-eb45-3077461540ca@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 10/27/19 10:58 PM, Thomas Petazzoni wrote:
> On Sun, 27 Oct 2019 22:10:23 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>>> This build failure is currently happening only on your machine:
>>>
>>>     http://autobuild.buildroot.net/?reason=host-icu-64-2
>>>
>>> Could you do some analysis of what's going on ?
>>
>> Basically there was not python3 distutils package installed, so i've
>> worked around it by installing it with:
>> sudo apt install python3-distutils
>> as referenced here:
>> https://github.com/Homebrew/linuxbrew-core/issues/12680
> 
> Wait, wait, that is weird. distutils is part of the Python standard
> library, so why is it provided as a separate package ?

I don't know python3 that much, anyway I've tried to find out 
informations, "python3-distutils" is a separate package since "bionic" 
Ubuntu while on Xenial it's present:
https://packages.ubuntu.com/bionic/python3-distutils

and it's not even suggested by "python3" package:
https://packages.ubuntu.com/bionic/python3

so this is why it's not found in Ubuntu 18.04(version running on my 
server) where python3 is installed, but on Xenial should be embedded in 
"python3" package.

While using python(2.x) there is not package python-distutils but only 
python-distutils-extra(that honestly I don't know what it is), so I 
suspect that in 2.x case distutils is part of "python" package the same 
as in Xenial python3 case.

Does this make sense for you?

-- 
Giulio Benetti
Benetti Engineering sas
