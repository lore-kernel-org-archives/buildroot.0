From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 23 Jan 2013 09:27:34 +0100
Subject: [Buildroot] [PATCH 2/3] python3: Port python2 patches to reduce
 the interpreter size
In-Reply-To: <50FAD25E.4010608@mind.be>
References: <1358517974-30956-1-git-send-email-maxime.ripard@free-electrons.com>
 <1358517974-30956-2-git-send-email-maxime.ripard@free-electrons.com>
 <50FAD25E.4010608@mind.be>
Message-ID: <50FF9EF6.2020603@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On 19/01/2013 18:05, Arnout Vandecappelle wrote:
> On 18/01/13 15:06, Maxime Ripard wrote:
>> Some of the python2 patches were left behind when doing the python3
>> package. This was because the python build system can now autodetect
>> what packages can be built in the system.
>>
>> However, some of these patches are actually useful to reduce drastically
>> the size of the interpreter.
>>
>> This patch ports the relevant patches to the python3 package, and adds a
>> new patch to remove the idle3 IDE as well from the interpreter.
>>
>> Fixes #5696
>>
>> Signed-off-by: Maxime Ripard<maxime.ripard@free-electrons.com>
>> ---
>>   package/python3/Config.in                          |   11 ++
>>   .../python3-3.3-012-disable-extensions.patch       |   98
>> +++++++++++++++++
> 
>  You should remove the -3.3- from the patch names. I know they're there
> in the old package, but this is a good opportunity to get rid of that
> legacy.

Right. Will do.

>  BTW, do these patches have a chance of getting upstreamed?

I don't think so, since most of them breaks (on purpose) the python
standard modules...

Maxime
-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
