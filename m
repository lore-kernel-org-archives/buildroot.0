From: Steve Calfee <stevecalfee@gmail.com>
Date: Tue, 12 Apr 2011 09:52:57 -0700
Subject: [Buildroot] which templates are used?
In-Reply-To: <201104120801.08028.minimod@morethan.org>
References: <4DA36046.2040606@michaelburghart.de>
	<4DA3709E.7070005@daccii.it>	<4DA3976B.40807@gmail.com>
	<201104120801.08028.minimod@morethan.org>
Message-ID: <4DA48369.3000904@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/12/11 06:01, Michael S. Zick wrote:
>> Mine patchrootfs is:
>> #!/bin/bash
>> #
>> # skript which runs before creating rootfs
>> #
>> #
>> MAINDIR=${1}/../../
>> SRCDIR=${MAINDIR}"target/device/beagleboard/skeleton/*"
>> DESTDIR=${1}
>> echo "***************patching some stuff in " ${DESTDIR} from ${SRCDIR}
>> #echo "DESTDIR " ${DESTDIR}
>> #echo "SRCDIR " ${SRCDIR}
>> #ls -l ${SRCDIR} ${SRCDIR}"/etc"
>> cp -rvp ${SRCDIR} ${DESTDIR}
>> echo "end of userdefined script before packing rootfs"
>>
>> So this copies the fs skeleton, recursively from the local directory
>> after every build. The trick is it just overlays the fs in the target,
>> so you only have to add files that are specific or changed in your
>> build. So if you tweak an existing file say in /etc, it will replace
>> that file. If you add a new file (maybe a script) say in /usr/bin it
>> will add that from your local tree into the build. The local skeleton
>> should stay very sparse.
>>
>> There is no way to remove files that are not needed etc, just remove
>> them locally in your skeleton and when buildroot is remade with a clean
>> it will get all sorted out.
>>
> 
> Would using rsync with appropriate options instead of cp do that trick?
> 
> Mike

Hi Mike,

Maybe, but I think you would have to have an entire tree in your local
directory, my goal was to have as few board specific files as necessary.
I haven't actually found it much of a problem growing litter in the file
system. And if it is I can always do the buildroot "make clean".

Regards, Steve
