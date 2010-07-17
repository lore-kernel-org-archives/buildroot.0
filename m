From: Ossy <ossy1980@gmx.net>
Date: Sat, 17 Jul 2010 12:17:43 +0200
Subject: [Buildroot] Bump xfsprogs to next version for better compatibility
	with arm
Message-ID: <4C418347.4070304@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi mailinglist,

I tried to use a newer version of xfsprogs (3.1.2). According to the 
xfs-homepage there are some issues fixed for usage with arm based systems.

I'll give it a green try by changing to higher version in xfsprogs.mk. I 
found a patch on gentoo (building with shared libs) and they changed the 
dependency from e2fsprogs to util-linux. I've done the same in 
xfsprogs.mk and Config.in in the packages directory.

Now I get an error. Libtool doesn't want to link it:
"libtool: link: only absolute run-paths are allowed"
Google gives a ton of hits, but I can't adapt any answer to building 
xfsprogs 3.1.2 within buildroot.

Maybe someone of the list readers trapped into the same error with 
building shared/static and host libpaths and internal br lib paths?

Thanks for any hint.

Kind regards,
Marcus



/usr/bin/make -j1 
PATH="/home/ossy/buildroot/buildroot-dev/output/host/bin:/home/ossy/buildroot/buildroot-dev/output/host/usr/bin:/home/ossy
/buildroot/buildroot-dev/output/host/usr/sbin/:/usr/local/bin:/usr/bin:/bin:/usr/games" 
CPPFLAGS="-I/home/ossy/buildroot/buildroot-dev/outpu
t/build/util-linux-2.13-pre7/lib" \
 
LDFLAGS="-L/home/ossy/buildroot/buildroot-dev/output/build/util-linux-2.13-pre7/lib" 
-C /home/ossy/buildroot/buildroot-dev/o
utput/build/xfsprogs-3.1.2
make[1]: Entering directory 
`/home/ossy/buildroot/buildroot-dev/output/build/xfsprogs-3.1.2'
Building include
Building libxfs
     [DEP]
     [LD]     libxfs.la
libtool: link: only absolute run-paths are allowed
