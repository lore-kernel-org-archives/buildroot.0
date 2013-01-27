From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sun, 27 Jan 2013 10:11:46 +0100
Subject: [Buildroot] rebuilding a project on older commits
In-Reply-To: <20130127093035.5537b93f@skate>
References: <51041908.1030803@googlemail.com> <20130127093035.5537b93f@skate>
Message-ID: <5104EF52.3010608@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Am 27.01.2013 09:30, schrieb Thomas Petazzoni:
> The easiest way is to use an external toolchain. This way, your
> toolchain is never rebuilt, but directly used pre-compiled.

Yes, this is the solution. Right now I build the toolchain with ct-ng
inside buildroot.
Is it possible to move this existing toolchain outside buildroot or
should I rebuild from scratch?

> Does Busybox has the init applet enabled? Is /sbin/init a symbolic link
> to /bin/busybox? Are the shared library loader and the C library both
> available in /lib in your root filesystem?

For the first two points I can answer with yes, but your tip with the
/lib folder is the right one. This folder is empty, and this also in the
output/target directory so it must be empty in the rootfs.tar too.

So the libraries in the /lib folder are missing there must be something
wrong with the config of the ct-ng? Any suggestions where I have to look to?


PS: I'm on a business trip shortly so I can't answer quickly.

-- 
Regards
Carsten

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: cst_hdx_2.6.34.13_defconfig
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130127/bd1eeef1/attachment-0003.ksh>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: busybox-1.20.2.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130127/bd1eeef1/attachment-0004.ksh>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: ct_ng_config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130127/bd1eeef1/attachment-0005.ksh>
