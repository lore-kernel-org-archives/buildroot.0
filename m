From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 May 2019 09:16:55 +0200
Subject: [Buildroot] [PATCH v3] package/wpebackend-fdo: package needs
 wayland libegl
In-Reply-To: <20190415091632.6437-1-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Mon, 15 Apr 2019 11:16:32 +0200")
References: <0ab8f13f-225e-29cd-c1e5-7ca2c3897ed6@mind.be>
 <20190415091632.6437-1-giulio.benetti@micronovasrl.com>
Message-ID: <87mujm27iw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > Now wpebackend-fdo depends only on HAS_LIBEGL but if libegl is not of
 > wayland type, build breaks due to different EGLNativeWindowType types
 > depending on backends(fb,x11,wl).

 > Modify:
 > 'depend on BR2_PACKAGE_HAS_LIBEGL'
 > to:
 > 'depend on BR2_PACKAGE_HAS_LIBEGL_WAYLAND'
 > in Config.in to avoid building if there is not a wayland egl backend.
 > Modify also comment in Config.in when package is not selectable
 > mentioning the need to have an OpenEGL-capable Wayland backend.

 > Fixes:
 > http://autobuild.buildroot.net/results/4f02b91f6ffffd194e09ed18c917b4f678b1a52d/

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 > ---
 > Changes:
 > V1-> V2:
 > * use BR2_PACKAGE_HAS_LIBEGL_WAYLAND only instead of using 
 >   BR2_PACKAGE_HAS_LIBEGL too
 > * add Wayland to comment

 > V2-> V3:
 > * add `\` at the end of `depends on`

Committed, thanks.

-- 
Bye, Peter Korsgaard
