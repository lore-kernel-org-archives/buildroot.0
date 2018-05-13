From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 May 2018 21:19:17 +0200
Subject: [Buildroot] [PATCH 2/8] jquery-ui-themes: rename options to
 have proper prefix
In-Reply-To: <20180513190737.26079-3-thomas.petazzoni@bootlin.com>
References: <20180513190737.26079-1-thomas.petazzoni@bootlin.com>
 <20180513190737.26079-3-thomas.petazzoni@bootlin.com>
Message-ID: <20180513191917.GF22130@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-05-13 21:07 +0200, Thomas Petazzoni spake thusly:
> The choice options to select the specific jquery-ui theme to install
> had a prefix of BR2_PACKAGE_JQUERY_UI_THEME_ instead of
> BR2_PACKAGE_JQUERY_UI_THEMES_. This commit fixes that, and adds
> Config.in.legacy handling. It's worse mentioning that since those

s/worse/worth/

Otherwise:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> options are part of a choice, the legacy handling cannot select the
> new name of the option: we can simply inform the user about the
> renaming.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  Config.in.legacy                   | 216 +++++++++++++++++++++++++++++++++++++
>  package/jquery-ui-themes/Config.in |  96 ++++++++---------
>  2 files changed, 264 insertions(+), 48 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 6d17f7de6d..4283888c72 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,222 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2018.05"
>  
> +config BR2_PACKAGE_JQUERY_UI_THEME_BLACK_TIE
> +	bool "jquery-ui-themes option black-tie renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  black-tie theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_BLACK_TIE to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_BLACK_TIE.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_BLITZER
> +	bool "jquery-ui-themes option blitzer renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  blitzer theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_BLITZER to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_BLITZER.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_CUPERTINO
> +	bool "jquery-ui-themes option cupertino renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  cupertino theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_CUPERTINO to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_CUPERTINO.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_DARK_HIVE
> +	bool "jquery-ui-themes option dark-hive renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  dark-hive theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_DARK_HIVE to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_DARK_HIVE.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_DOT_LUV
> +	bool "jquery-ui-themes option dot-luv renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  dot-luv theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_DOT_LUV to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_DOT_LUV.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_EGGPLANT
> +	bool "jquery-ui-themes option eggplant renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  eggplant theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_EGGPLANT to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_EGGPLANT.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_EXCITE_BIKE
> +	bool "jquery-ui-themes option excite-bike renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  excite-bike theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_EXCITE_BIKE to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_EXCITE_BIKE.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_FLICK
> +	bool "jquery-ui-themes option flick renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  flick theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_FLICK to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_FLICK.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_HOT_SNEAKS
> +	bool "jquery-ui-themes option hot-sneaks renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  hot-sneaks theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_HOT_SNEAKS to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_HOT_SNEAKS.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_HUMANITY
> +	bool "jquery-ui-themes option humanity renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  humanity theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_HUMANITY to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_HUMANITY.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_LE_FROG
> +	bool "jquery-ui-themes option le-frog renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  le-frog theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_LE_FROG to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_LE_FROG.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_MINT_CHOC
> +	bool "jquery-ui-themes option mint-choc renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  mint-choc theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_MINT_CHOC to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_MINT_CHOC.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_OVERCAST
> +	bool "jquery-ui-themes option overcast renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  overcast theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_OVERCAST to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_OVERCAST.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_PEPPER_GRINDER
> +	bool "jquery-ui-themes option pepper-grinder renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  pepper-grinder theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_PEPPER_GRINDER to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_PEPPER_GRINDER.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_REDMOND
> +	bool "jquery-ui-themes option redmond renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  redmond theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_REDMOND to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_REDMOND.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_SMOOTHNESS
> +	bool "jquery-ui-themes option smoothness renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  smoothness theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_SMOOTHNESS to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_SMOOTHNESS.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_SOUTH_STREET
> +	bool "jquery-ui-themes option south-street renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  south-street theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_SOUTH_STREET to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_SOUTH_STREET.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_START
> +	bool "jquery-ui-themes option start renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  start theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_START to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_START.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_SUNNY
> +	bool "jquery-ui-themes option sunny renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  sunny theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_SUNNY to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_SUNNY.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_SWANKY_PURSE
> +	bool "jquery-ui-themes option swanky-purse renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  swanky-purse theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_SWANKY_PURSE to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_SWANKY_PURSE.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_TRONTASTIC
> +	bool "jquery-ui-themes option trontastic renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  trontastic theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_TRONTASTIC to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_TRONTASTIC.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_UI_DARKNESS
> +	bool "jquery-ui-themes option ui-darkness renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  ui-darkness theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_UI_DARKNESS to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_UI_DARKNESS.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_UI_LIGHTNESS
> +	bool "jquery-ui-themes option ui-lightness renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  ui-lightness theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_UI_LIGHTNESS to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_UI_LIGHTNESS.
> +
> +config BR2_PACKAGE_JQUERY_UI_THEME_VADER
> +	bool "jquery-ui-themes option vader renamed"
> +	select BR2_LEGACY
> +	help
> +	  For consistency reasons, the jquery-ui-themes option for the
> +	  vader theme has been renamed from
> +	  BR2_PACKAGE_JQUERY_UI_THEME_VADER to
> +	  BR2_PACKAGE_JQUERY_UI_THEMES_VADER.
> +
>  config BR2_PACKAGE_BLUEZ5_PLUGINS_HEALTH
>  	bool "bluez5-utils health plugin option renamed"
>  	select BR2_LEGACY
> diff --git a/package/jquery-ui-themes/Config.in b/package/jquery-ui-themes/Config.in
> index fde3014602..29359544ac 100644
> --- a/package/jquery-ui-themes/Config.in
> +++ b/package/jquery-ui-themes/Config.in
> @@ -13,105 +13,105 @@ choice
>  	help
>  	  Specify the jQuery UI theme to install.
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_BLACK_TIE
> +config BR2_PACKAGE_JQUERY_UI_THEMES_BLACK_TIE
>  	bool "black-tie"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_BLITZER
> +config BR2_PACKAGE_JQUERY_UI_THEMES_BLITZER
>  	bool "blitzer"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_CUPERTINO
> +config BR2_PACKAGE_JQUERY_UI_THEMES_CUPERTINO
>  	bool "cupertino"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_DARK_HIVE
> +config BR2_PACKAGE_JQUERY_UI_THEMES_DARK_HIVE
>  	bool "dark-hive"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_DOT_LUV
> +config BR2_PACKAGE_JQUERY_UI_THEMES_DOT_LUV
>  	bool "dot-luv"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_EGGPLANT
> +config BR2_PACKAGE_JQUERY_UI_THEMES_EGGPLANT
>  	bool "eggplant"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_EXCITE_BIKE
> +config BR2_PACKAGE_JQUERY_UI_THEMES_EXCITE_BIKE
>  	bool "excite-bike"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_FLICK
> +config BR2_PACKAGE_JQUERY_UI_THEMES_FLICK
>  	bool "flick"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_HOT_SNEAKS
> +config BR2_PACKAGE_JQUERY_UI_THEMES_HOT_SNEAKS
>  	bool "hot-sneaks"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_HUMANITY
> +config BR2_PACKAGE_JQUERY_UI_THEMES_HUMANITY
>  	bool "humanity"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_LE_FROG
> +config BR2_PACKAGE_JQUERY_UI_THEMES_LE_FROG
>  	bool "le-frog"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_MINT_CHOC
> +config BR2_PACKAGE_JQUERY_UI_THEMES_MINT_CHOC
>  	bool "mint-choc"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_OVERCAST
> +config BR2_PACKAGE_JQUERY_UI_THEMES_OVERCAST
>  	bool "overcast"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_PEPPER_GRINDER
> +config BR2_PACKAGE_JQUERY_UI_THEMES_PEPPER_GRINDER
>  	bool "pepper-grinder"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_REDMOND
> +config BR2_PACKAGE_JQUERY_UI_THEMES_REDMOND
>  	bool "redmond"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_SMOOTHNESS
> +config BR2_PACKAGE_JQUERY_UI_THEMES_SMOOTHNESS
>  	bool "smoothness"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_SOUTH_STREET
> +config BR2_PACKAGE_JQUERY_UI_THEMES_SOUTH_STREET
>  	bool "south-street"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_START
> +config BR2_PACKAGE_JQUERY_UI_THEMES_START
>  	bool "start"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_SUNNY
> +config BR2_PACKAGE_JQUERY_UI_THEMES_SUNNY
>  	bool "sunny"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_SWANKY_PURSE
> +config BR2_PACKAGE_JQUERY_UI_THEMES_SWANKY_PURSE
>  	bool "swanky-purse"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_TRONTASTIC
> +config BR2_PACKAGE_JQUERY_UI_THEMES_TRONTASTIC
>  	bool "trontastic"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_UI_DARKNESS
> +config BR2_PACKAGE_JQUERY_UI_THEMES_UI_DARKNESS
>  	bool "ui-darkness"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_UI_LIGHTNESS
> +config BR2_PACKAGE_JQUERY_UI_THEMES_UI_LIGHTNESS
>  	bool "ui-lightness"
>  
> -config BR2_PACKAGE_JQUERY_UI_THEME_VADER
> +config BR2_PACKAGE_JQUERY_UI_THEMES_VADER
>  	bool "vader"
>  
>  endchoice
>  
>  config BR2_PACKAGE_JQUERY_UI_THEMES_THEME
>  	string
> -	default "black-tie"		if BR2_PACKAGE_JQUERY_UI_THEME_BLACK_TIE
> -	default "blitzer"		if BR2_PACKAGE_JQUERY_UI_THEME_BLITZER
> -	default "cupertino"		if BR2_PACKAGE_JQUERY_UI_THEME_CUPERTINO
> -	default "dark-hive"		if BR2_PACKAGE_JQUERY_UI_THEME_DARK_HIVE
> -	default "dot-luv"		if BR2_PACKAGE_JQUERY_UI_THEME_DOT_LUV
> -	default "eggplant"		if BR2_PACKAGE_JQUERY_UI_THEME_EGGPLANT
> -	default "excite-bike"		if BR2_PACKAGE_JQUERY_UI_THEME_EXCITE_BIKE
> -	default "flick"			if BR2_PACKAGE_JQUERY_UI_THEME_FLICK
> -	default "hot-sneaks"		if BR2_PACKAGE_JQUERY_UI_THEME_HOT_SNEAKS
> -	default "humanity"		if BR2_PACKAGE_JQUERY_UI_THEME_HUMANITY
> -	default "le-frog"		if BR2_PACKAGE_JQUERY_UI_THEME_LE_FROG
> -	default "mint-choc"		if BR2_PACKAGE_JQUERY_UI_THEME_MINT_CHOC
> -	default "overcast"		if BR2_PACKAGE_JQUERY_UI_THEME_OVERCAST
> -	default "pepper-grinder"	if BR2_PACKAGE_JQUERY_UI_THEME_PEPPER_GRINDER
> -	default "redmond"		if BR2_PACKAGE_JQUERY_UI_THEME_REDMOND
> -	default "smoothness"		if BR2_PACKAGE_JQUERY_UI_THEME_SMOOTHNESS
> -	default "south-street"		if BR2_PACKAGE_JQUERY_UI_THEME_SOUTH_STREET
> -	default "start"			if BR2_PACKAGE_JQUERY_UI_THEME_START
> -	default "sunny"			if BR2_PACKAGE_JQUERY_UI_THEME_SUNNY
> -	default "swanky-purse"		if BR2_PACKAGE_JQUERY_UI_THEME_SWANKY_PURSE
> -	default "trontastic"		if BR2_PACKAGE_JQUERY_UI_THEME_TRONTASTIC
> -	default "ui-darkness"		if BR2_PACKAGE_JQUERY_UI_THEME_UI_DARKNESS
> -	default "ui-lightness"		if BR2_PACKAGE_JQUERY_UI_THEME_UI_LIGHTNESS
> -	default "vader"			if BR2_PACKAGE_JQUERY_UI_THEME_UI_VADER
> +	default "black-tie"		if BR2_PACKAGE_JQUERY_UI_THEMES_BLACK_TIE
> +	default "blitzer"		if BR2_PACKAGE_JQUERY_UI_THEMES_BLITZER
> +	default "cupertino"		if BR2_PACKAGE_JQUERY_UI_THEMES_CUPERTINO
> +	default "dark-hive"		if BR2_PACKAGE_JQUERY_UI_THEMES_DARK_HIVE
> +	default "dot-luv"		if BR2_PACKAGE_JQUERY_UI_THEMES_DOT_LUV
> +	default "eggplant"		if BR2_PACKAGE_JQUERY_UI_THEMES_EGGPLANT
> +	default "excite-bike"		if BR2_PACKAGE_JQUERY_UI_THEMES_EXCITE_BIKE
> +	default "flick"			if BR2_PACKAGE_JQUERY_UI_THEMES_FLICK
> +	default "hot-sneaks"		if BR2_PACKAGE_JQUERY_UI_THEMES_HOT_SNEAKS
> +	default "humanity"		if BR2_PACKAGE_JQUERY_UI_THEMES_HUMANITY
> +	default "le-frog"		if BR2_PACKAGE_JQUERY_UI_THEMES_LE_FROG
> +	default "mint-choc"		if BR2_PACKAGE_JQUERY_UI_THEMES_MINT_CHOC
> +	default "overcast"		if BR2_PACKAGE_JQUERY_UI_THEMES_OVERCAST
> +	default "pepper-grinder"	if BR2_PACKAGE_JQUERY_UI_THEMES_PEPPER_GRINDER
> +	default "redmond"		if BR2_PACKAGE_JQUERY_UI_THEMES_REDMOND
> +	default "smoothness"		if BR2_PACKAGE_JQUERY_UI_THEMES_SMOOTHNESS
> +	default "south-street"		if BR2_PACKAGE_JQUERY_UI_THEMES_SOUTH_STREET
> +	default "start"			if BR2_PACKAGE_JQUERY_UI_THEMES_START
> +	default "sunny"			if BR2_PACKAGE_JQUERY_UI_THEMES_SUNNY
> +	default "swanky-purse"		if BR2_PACKAGE_JQUERY_UI_THEMES_SWANKY_PURSE
> +	default "trontastic"		if BR2_PACKAGE_JQUERY_UI_THEMES_TRONTASTIC
> +	default "ui-darkness"		if BR2_PACKAGE_JQUERY_UI_THEMES_UI_DARKNESS
> +	default "ui-lightness"		if BR2_PACKAGE_JQUERY_UI_THEMES_UI_LIGHTNESS
> +	default "vader"			if BR2_PACKAGE_JQUERY_UI_THEMES_UI_VADER
>  
>  endif
> -- 
> 2.14.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
