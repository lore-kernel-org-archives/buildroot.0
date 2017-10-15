From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Oct 2017 15:56:51 +0200
Subject: [Buildroot] [git commit branch/2017.02.x]
 package/x11r7/xserver_xorg-server: security bump to version 1.19.4
In-Reply-To: <20171014150059.CC3577FDF0@busybox.osuosl.org>
References: <20171014150059.CC3577FDF0@busybox.osuosl.org>
Message-ID: <20171015155651.50c30cef@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 Oct 2017 14:35:33 +0200, Peter Korsgaard wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=2b5fe1c29e1a4a8697e0b0eeea4fbf66cd089e79
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x
> 
> Fixes CVE-2017-13721 & CVE-2017-13723:
> https://lists.x.org/archives/xorg-announce/2017-October/002809.html
> 
> Added all hashes provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> (cherry picked from commit 436659c55f8d3c6155546cfc666a13c793d992f9)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/x11r7/xserver_xorg-server/Config.in                | 2 +-
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 7 +++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
> index b04ccf4..0f1e819 100644
> --- a/package/x11r7/xserver_xorg-server/Config.in
> +++ b/package/x11r7/xserver_xorg-server/Config.in
> @@ -99,7 +99,7 @@ endchoice
>  
>  config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
>  	string
> -	default "1.19.3" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
> +	default "1.19.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
>  	default "1.17.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
>  	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14

Note that this commit forgot to update:

config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
        bool "1.19.3"

It will be fixed, as I'm going to apply
https://patchwork.ozlabs.org/patch/825811/, which bumps to 1.19.5, in
both locations.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
