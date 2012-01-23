From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 23 Jan 2012 14:46:03 +0100
Subject: [Buildroot] mesa gles2 under buildroot
In-Reply-To: <CAPeX=+sR6a610=ED01DMSPxGtNwjvuCwOOR48EG0TsQkB_T52Q@mail.gmail.com>
 (Ozgun's message of "Mon, 23 Jan 2012 15:13:57 +0200")
References: <CAPeX=+tVeJ6wip9tXgte5-8+qFqdxGNPU4NfyrdPs-a7fS8gsg@mail.gmail.com>
 <CAPeX=+sR6a610=ED01DMSPxGtNwjvuCwOOR48EG0TsQkB_T52Q@mail.gmail.com>
Message-ID: <87vco2a5wk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ozgun" == Ozgun  <ozgun.gunay@gmail.com> writes:

 Ozgun> I'm using buildroot-2011.11 on ubuntu 11.10 for pc104 card with atom processor.
 Ozgun> The patches and the following patches solved the problem.

Ehh, what is this against? You seem to be changing the file from
something old to the current state of git head?

 Ozgun> diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7
 Ozgun> /xutil_makedepend/xutil_makedepend.mk
 Ozgun> index b0bbafd..a69d21f 100644
 Ozgun> --- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
 Ozgun> +++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
 Ozgun> @@ -4,14 +4,11 @@
 Ozgun> #
 Ozgun> ###############################################################################
 Ozgun> #
 Ozgun> -XUTIL_MAKEDEPEND_VERSION = 1.0.1
 Ozgun> +XUTIL_MAKEDEPEND_VERSION = 1.0.2
 Ozgun> XUTIL_MAKEDEPEND_SOURCE = makedepend-$(XUTIL_MAKEDEPEND_VERSION).tar.bz2
 Ozgun> XUTIL_MAKEDEPEND_SITE = http://xorg.freedesktop.org/releases/individual/util
 Ozgun> -XUTIL_MAKEDEPEND_AUTORECONF = NO
 Ozgun> -XUTIL_MAKEDEPEND_INSTALL_STAGING = NO
 Ozgun> -XUTIL_MAKEDEPEND_INSTALL_TARGET = YES
 Ozgun> -HOST_XUTIL_MAKEDEPEND_DEPENDENCIES = host-xproto-xproto
 Ozgun> +XUTIL_MAKEDEPEND_DEPENDENCIES = xproto_xproto
 Ozgun> -$(eval $(call AUTOTARGETS,package/x11r7,xutil_makedepend))
 Ozgun> -$(eval $(call AUTOTARGETS,package/x11r7,xutil_makedepend,host))
 Ozgun> +$(eval $(call AUTOTARGETS))
 Ozgun> +$(eval $(call AUTOTARGETS,host))


 Ozgun> _______________________________________________
 Ozgun> buildroot mailing list
 Ozgun> buildroot at busybox.net
 Ozgun> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
