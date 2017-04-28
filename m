From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 28 Apr 2017 22:23:59 +0200
Subject: [Buildroot] [PATCH v2] x11vnc: update to 0.9.14
In-Reply-To: <1493210235-7076-1-git-send-email-martin.kepplinger@ginzinger.com>
References: <20170426100320.00702ce9@free-electrons.com>
 <1493210235-7076-1-git-send-email-martin.kepplinger@ginzinger.com>
Message-ID: <65322dd8-3b6b-e421-5e5b-9c69d88355a3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Martin,

On 26-04-17 14:37, Martin Kepplinger wrote:
> This uses x11vnc's new upstream location at github. Autoreconf is
> added because it's really only a code snapshot release.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
> ---
> 
> In the end you're right and there's nothing special here. Without any reason,
> buildroot doesn't hold on an old version. People do releases. People break
> stuff. People fix stuff. Since I happen to need a fix in the upcoming 0.9.15
> this is probably more reason to randomly update than other updates have.
> 
> ... I tested it. For me, using Xfbdev, this 0.9.14 works just fine :)
> 
> 
> revision history
> ----------------
> v2: use the github helper instead of a URL
> v1: initial proposal to update 0.9.13 to 0.9.14
> 
> 
>  package/x11vnc/x11vnc.hash | 2 +-
>  package/x11vnc/x11vnc.mk   | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/x11vnc/x11vnc.hash b/package/x11vnc/x11vnc.hash
> index 5828b12..3cdbfa1 100644
> --- a/package/x11vnc/x11vnc.hash
> +++ b/package/x11vnc/x11vnc.hash
> @@ -1,2 +1,2 @@
>  # Locally computed:
> -sha256  f6829f2e629667a5284de62b080b13126a0736499fe47cdb447aedb07a59f13b  x11vnc-0.9.13.tar.gz
> +sha256  45f87c5e4382988c73e8c7891ac2bfb45d8f9ce1196ae06651c84636684ea143  x11vnc-0.9.14.tar.gz
> diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
> index 9f4af12..6c862dd 100644
> --- a/package/x11vnc/x11vnc.mk
> +++ b/package/x11vnc/x11vnc.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -X11VNC_VERSION = 0.9.13
> -X11VNC_SITE = http://downloads.sourceforge.net/project/libvncserver/x11vnc/$(X11VNC_VERSION)
> +X11VNC_VERSION = 0.9.14
> +X11VNC_SITE = $(call github,LibVNC,x11vnc,$(X11VNC_VERSION))
>  # sdl support is not used in x11vnc, but host include / library search paths
>  # leak in if host has sdl-config
>  X11VNC_CONF_OPTS = --without-sdl
> @@ -13,6 +13,8 @@ X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext xlib_libXtst
>  X11VNC_LICENSE = GPL-2.0+
>  X11VNC_LICENSE_FILES = COPYING
>  
> +X11VNC_AUTORECONF = YES

 Please add a comment above it:

# Source coming from github, no configure included


 If you resubmit, you can add my

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>



 Regards,
 Arnout


> +
>  ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
>  X11VNC_DEPENDENCIES += avahi dbus
>  else
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
