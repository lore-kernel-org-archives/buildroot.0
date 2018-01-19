From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Jan 2018 22:48:30 +0100
Subject: [Buildroot] [PATCH] package/xen: Force disable SDL for xen-qemu
 build
In-Reply-To: <20180118215230.27648-1-alistair.francis@xilinx.com> (Alistair
 Francis's message of "Thu, 18 Jan 2018 13:52:30 -0800")
References: <20180118215230.27648-1-alistair.francis@xilinx.com>
Message-ID: <87inbxcyfl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alistair" == Alistair Francis <alistair.francis@xilinx.com> writes:

 > Fixes autobuilder issue:
 > http://autobuild.buildroot.net/results/8bcb80dc93d38bb38ca32ad93d52c22d1176d57e/

 > Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
 > ---
 > V2:
 >  - Don't add a patch, just edit the make options

 >  package/xen/xen.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/xen/xen.mk b/package/xen/xen.mk
 > index 6aa066e4e2..8ba2b9d5c2 100644
 > --- a/package/xen/xen.mk
 > +++ b/package/xen/xen.mk
 > @@ -43,6 +43,7 @@ XEN_DEPENDENCIES += argp-standalone
 >  endif
 >  XEN_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-tools
 >  XEN_MAKE_OPTS += dist-tools
 > +XEN_CONF_OPTS += --with-extra-qemuu-configure-args="--disable-sdl"

I was going to say that you had an extra 'u' in qemu, but that is
apparently really how the configure option is called.

Committed, thanks.

-- 
Bye, Peter Korsgaard
