From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Sep 2020 22:18:01 +0200
Subject: [Buildroot] [PATCH 3/3] package/x11r7/xserver_xorg-server:
 remove unmaintained versions 1.14.7 & 1.17.4
In-Reply-To: <20200829113403.122144-3-bernd.kuhls@t-online.de>
References: <20200829113403.122144-1-bernd.kuhls@t-online.de>
 <20200829113403.122144-3-bernd.kuhls@t-online.de>
Message-ID: <00ce695c-83b5-bf4e-220b-cae85233ad1b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/08/2020 13:34, Bernd Kuhls wrote:
> diff --git a/Config.in.legacy b/Config.in.legacy
> index b91e6dbc69..45fb18540b 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,12 @@ endif
>  
>  comment "Legacy options removed in 2020.08"
>  
> +config BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX
> +	bool "X.org Enable AIGLX Extension"
> +	select BR2_LEGACY
> +	help
> +	  AIGLX Extension was removed in X.org X server version 1.19.0
> +
>  config BR2_PACKAGE_AMD_CATALYST
>  	bool "amd-catalyst"
>  	select BR2_LEGACY

 There was also still a reference to BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19 in
Config.in.legacy, so I removed that.

 Regards,
 Arnout
