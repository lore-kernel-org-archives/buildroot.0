From: Ossy <ossy1980@gmx.net>
Date: Thu, 15 Jul 2010 21:20:37 +0200
Subject: [Buildroot] mkfs.xfs without xfs library - not possible to
 create xfsfs
In-Reply-To: <4C3CCFF0.3080407@gmx.net>
References: <4C3A1F60.7050009@gmx.net> <4C3CCFF0.3080407@gmx.net>
Message-ID: <4C3F5F85.8020405@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 13.07.2010 22:43, schrieb Ossy:
> Am 11.07.2010 21:45, schrieb Ossy:
>> Hi mailinglist,
>>
>> I tried to create an xfs filesystem. Unfortunatly there is a library
>> missing. I looked around in the configuration menu, but all I found were
>> the xfsprogs. Under libraries/filesystem there is no xfslib either.
>>
>> $ ./sbin/mkfs.xfs
>> ./sbin/mkfs.xfs: can't load library 'libxfs.so.0'
>>
>
> I do not expect an e2fs-library path in xfsprogs.config. Maybe a
> dependency to e2fs? Or is it just a bug?
>
> I bumbed xfsprogs to 3.1.2 temporarily but this version failed to build.

The main problem remains. xfsprogs-3.0.3 does not build the libxfs.so.0.
I found a patch for xfsprogs-3.1 on gentoo. May be it would help to work 
around the problem and may be it is possible to bump to the newer version.

http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-fs/xfsprogs/
ebuild:
97 	src_install() {
98 	# TODO: there is a seldomly triggered parallel install problem where
99 	# libxfs.so doesn't get installed before rdeps causing the relink to 
fail
...

and:
xfsprogs-3.1.1-sharedlibs.patch
(Buildroot compiles the packages with a shared c-lib, too.)
