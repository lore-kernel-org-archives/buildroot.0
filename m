From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 5 Dec 2019 21:54:53 +0100
Subject: [Buildroot] libdrm: buildroot patchstack - static linking
Message-ID: <20191205215234.7058f6df@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *,

some progress on up-streaming the buildroot libdrm patch stack:

 - 0001-Add-ARM-support-into-xf86drm.h.patch
   https://gitlab.freedesktop.org/mesa/drm/merge_requests/31
   Acked, but with one further question 'why not catch-all __ARM_ARCH?'
   Thomas - you touched the patch and added the comment, any further input?

 - 0002-xf86atomic-require-CAS-support-in-libatomic_ops.patch
   https://gitlab.freedesktop.org/mesa/drm/merge_requests/32
   Acked

 - 0003-meson.build-fix-intel-atomics-detection.patch
   merged https://gitlab.freedesktop.org/mesa/drm/merge_requests/27

 - 0004-meson.build-enable-static-build.patch
   declined https://gitlab.freedesktop.org/mesa/drm/merge_requests/28
   'Closing the MR, but feel free to reopen if it turns out someone has
   a real need for this'

   Anyone out there using libdrm static linking?

 - 0005-tests-meson.build-disable-nouveau-tests-for-static-b.patch
   folded into previous one https://gitlab.freedesktop.org/mesa/drm/merge_requests/27
   and declined

 - 0006-tests-nouveau-threaded-adapt-ioctl-signature.patch:
   merged https://gitlab.freedesktop.org/mesa/drm/merge_requests/30

Regards,
Peter
