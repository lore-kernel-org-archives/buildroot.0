From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 6 Jul 2017 23:50:39 +0200
Subject: [Buildroot] ARM cross compiler path error "no such file or
 directory"
In-Reply-To: <20170706173509.5181f14d@windsurf.lan>
References: <5ea74359-6a01-7668-c1d2-3784711227ab@newflow.co.uk>
 <20170706173509.5181f14d@windsurf.lan>
Message-ID: <da907d83-16e4-4b89-6d4b-db3d686a2a85@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-07-17 17:35, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 6 Jul 2017 15:34:27 +0100, Mark Jackson wrote:
> 
>> I can successfully compile "beaglebone_defconfig".
>>
>> $ make clean
>> $ make beaglebone_defconfig
>> $ make
>>
>> And in output/host/usr/bin, I can find all the "arm-linux-xyz" cross compiler tools (gcc, strings, strip, etc).
>>
>> But when I try to use these to compile my own code, I get an error as follows:-
>>
>> $ which arm-linux-gcc
>> /home/mpfj/buildroot/output/host/usr/bin/arm-linux-gcc
>> $ arm-linux-gcc
>> /home/mpfj/buildroot/output/usr/bin/arm-linux-gcc.br_real: No such file or directory
>>
>> Quite correctly, "output/usr/bin" doesn't exist ... the files are in "output/host/usr/bin"
>>
>> arm-linux-gcc is just a symlink to toolchain-wrapper, so toolchain-wrapper seems to be pointing to the wrong directory!!
>>
>> I'm sure was working yesterday, but I did a "git pull" this morning, so it may be something quite recent ??
> 
> We pushed some changes over the last few days that moved everything in
> $(HOST_DIR)/usr up into $(HOST_DIR), so it is possible that there are
> some regressions.

 You need to rebuild the toolchain (actually the toolchain wrapper) after this
change. And probably other things need to be rebuilt as well. To be safe, do a
"make clean; make".

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
