From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2020 22:17:21 +0200
Subject: [Buildroot] [git commit] package/wpewebkit: security bump to
 version 2.28.2
In-Reply-To: <20200426194053.67C0581059@busybox.osuosl.org>
References: <20200426194053.67C0581059@busybox.osuosl.org>
Message-ID: <20200426201721.GB2831@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2020-04-26 21:55 +0200, Yann E. MORIN spake thusly:
> commit: https://git.buildroot.net/buildroot/commit/?id=e028d52b7eb6681474add386af62b48d3f2989c6
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> This is a minor release which provides fixes for CVE-2020-11793,
> CVE-2020-3887, CVE-2020-3894, and CVE-2020-3899.
> 
> Updating from 2.28.0 also brings a few rendering fixes, a build fix
> on MIPS64, a build fix for GStreamer 1.12, and solves a couple of
> crashes. The full release notes covering 2.28.1 and 2.28.2 can be
> found at:
> 
>   https://wpewebkit.org/release/wpewebkit-2.28.1.html
>   https://wpewebkit.org/release/wpewebkit-2.28.2.html
> 
> A detailed security advisory can be found at:
> 
>   https://wpewebkit.org/security/WSA-2020-0004.html
> 
> Note that the above does not cover all the CVEs, and a new advisory
> including them is expected to be published in the next days.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> [yann.morin.1998 at free.fr: two spaces in hash file]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/webkitgtk/webkitgtk.hash | 6 +++---
>  package/wpewebkit/wpewebkit.hash | 8 ++++----
>  package/wpewebkit/wpewebkit.mk   | 2 +-
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
> index b63a734e3d..1d79d34e27 100644
> --- a/package/webkitgtk/webkitgtk.hash
> +++ b/package/webkitgtk/webkitgtk.hash
> @@ -1,7 +1,7 @@
>  # From https://webkitgtk.org/releases/webkitgtk-2.28.0.tar.xz.sums
> -md5 0bf11df8117ea64f6b8de59d278a2c78 webkitgtk-2.28.0.tar.xz
> -sha1 927d0922b986fd06567015ce4425ed05d9fca209 webkitgtk-2.28.0.tar.xz
> -sha256 361f3d178f62a9c112cbadfedd46106c34455c26d57a12a28fb3b09178d20e8b webkitgtk-2.28.0.tar.xz
> +md5  0bf11df8117ea64f6b8de59d278a2c78  webkitgtk-2.28.0.tar.xz
> +sha1  927d0922b986fd06567015ce4425ed05d9fca209  webkitgtk-2.28.0.tar.xz
> +sha256  361f3d178f62a9c112cbadfedd46106c34455c26d57a12a28fb3b09178d20e8b  webkitgtk-2.28.0.tar.xz
>  
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE

So there was some mishap here: I wanted to apply the webkitgtk patch,
but right between the moment I looked at it, and the moment I applied
the patch, Adrian sent the wpewbkit update, which got to be the latest
in the list, and the one I applied instead of the webkitgtk one.

Sigh...

Regards,
Yann E. MORIN.

> diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
> index 2e7016fe38..8c660d3003 100644
> --- a/package/wpewebkit/wpewebkit.hash
> +++ b/package/wpewebkit/wpewebkit.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/wpewebkit-2.28.0.tar.xz.sums
> -md5  4298b9d38b4f05f92995422ea9979893  wpewebkit-2.28.0.tar.xz
> -sha1  9e791b6112cca8cda51ae7e991b545f4bf0bb46c  wpewebkit-2.28.0.tar.xz
> -sha256  a85cd3cb46206a4929a9562d53379a7e7e2ec1a3224b34e2dcf5da30bb906722  wpewebkit-2.28.0.tar.xz
> +# From https://wpewebkit.org/releases/wpewebkit-2.28.2.tar.xz.sums
> +md5  c1f17d4b031e9462692443e3c089789c  wpewebkit-2.28.2.tar.xz
> +sha1  b109cfec921eb466227ab3b8d21c5f5717311c8e  wpewebkit-2.28.2.tar.xz
> +sha256  6929d28744702ead3574484ca02645c457a6fdcd6b43ccc9766d98dc3664e8dc  wpewebkit-2.28.2.tar.xz
>  
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index 9c969cae5a..a6124d3529 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WPEWEBKIT_VERSION = 2.28.0
> +WPEWEBKIT_VERSION = 2.28.2
>  WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
>  WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
>  WPEWEBKIT_INSTALL_STAGING = YES
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
