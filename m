From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Dec 2018 19:21:05 +0100
Subject: [Buildroot] [PATCH 1/1] ccid: fix build with pkgconf 1.5.3
In-Reply-To: <20181211172124.30082-1-fontaine.fabrice@gmail.com>
References: <20181211172124.30082-1-fontaine.fabrice@gmail.com>
Message-ID: <d8aca54b-9283-d230-e3ba-7cbba7472ddd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/12/2018 18:21, Fabrice Fontaine wrote:
> Do not add DESTDIR before usbdropdir to install pcsc drivers in
> src/Makefile.am.
> 
> Indeed, usbdropdir is retrieved from libpcsc.pc and can be prefixed by
> sysroot, so it can can be set for example to:
> usbdropdir='/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-3/output/host/bin/../microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/pcsc/drivers'
> 
> If DESTDIR is added before usbdropdir, files will be installed in a
> wrong directory and build will fail

 I have the feeling this is not the right fix. I think the problem really is
that pkg-config should prefix usbdropdir with sysroot. To me it seems that the
right thing to do is to add the sysroot to -L and -I flags, but not to add it to
random variables...

 Maybe other people who have a better understanding of how pkg-config is
supposed to work can shed some light?

 Regards,
 Arnout
