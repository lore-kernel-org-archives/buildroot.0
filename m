From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Aug 2017 23:11:19 +0200
Subject: [Buildroot] [PATCH 1/1] libepoxy: add patch to fix segfaults
 when using in X11 without GLX
In-Reply-To: <20170814213117.4735-1-aperez@igalia.com>
References: <20170814213117.4735-1-aperez@igalia.com>
Message-ID: <20170816231119.7c6684ff@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Aug 2017 00:31:17 +0300, Adrian Perez de Castro wrote:
> This adds a patch cherry-picked from libepoxy 1.4.2, which adds missing
> NULL-pointer checks and avoids segmentation faults when using libepoxy
> under X11, when the server does not have the GLX extension, or it is
> disabled -- and applications can still use EGL.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...nal_has_gl_extension-epoxy_egl_version-ad.patch | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 package/libepoxy/0003-epoxy_internal_has_gl_extension-epoxy_egl_version-ad.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
