From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Aug 2016 07:43:50 -0300
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-intel:
 bump version
In-Reply-To: <87a8h1v8em.fsf@dell.be.48ers.dk>
References: <1469729121-557-1-git-send-email-bernd.kuhls@t-online.de>
 <87a8h1v8em.fsf@dell.be.48ers.dk>
Message-ID: <28310532-f9c6-476b-deac-521acb19b976@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/07/16 17:01, Peter Korsgaard wrote:

> Committed, thanks.

Hi.
This bump causes build failure for this simplified defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I915=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL=y
BR2_PACKAGE_XPROTO_DRI3PROTO=y

As in:

gen4_vertex.c: In function ?emit_span_primitive?:
gen4_vertex.c:2044:1: error: inlining failed in call to always_inline 
?emit_span_vertex?: target specific option mismatch
  emit_span_vertex(struct sna *sna,
  ^
gen4_vertex.c:2058:2: error: called from here
   emit_span_vertex(sna, op, box->x2, box->y2);
   ^
gen4_vertex.c:2044:1: error: inlining failed in call to always_inline 
?emit_span_vertex?: target specific option mismatch
  emit_span_vertex(struct sna *sna,
  ^
gen4_vertex.c:2061:2: error: called from here
   emit_span_vertex(sna, op, box->x1, box->y2);
   ^
gen4_vertex.c:2044:1: error: inlining failed in call to always_inline 
?emit_span_vertex?: target specific option mismatch
  emit_span_vertex(struct sna *sna,
  ^
gen4_vertex.c:2064:2: error: called from here
   emit_span_vertex(sna, op, box->x1, box->y1);
   ^
Makefile:653: recipe for target 'gen4_vertex.lo' failed
make[5]: *** [gen4_vertex.lo] Error 1

Reverting builds fine, so a fix would be nice, or otherwise reverting 
the bump.
Regards.
