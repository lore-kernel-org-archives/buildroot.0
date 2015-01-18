From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jan 2015 17:24:00 +0100
Subject: [Buildroot] [PATCH 2/2] haserl: remove deprecated 0.8.x version
In-Reply-To: <1421329232-21302-2-git-send-email-gustavo@zacarias.com.ar>
References: <1421329232-21302-1-git-send-email-gustavo@zacarias.com.ar>
 <1421329232-21302-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150118162400.GP4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-01-15 10:40 -0300, Gustavo Zacarias spake thusly:
> It'll be a year for the 2015.02 release so remove the old/deprecated
> 0.8.x version for the release.
> 
> Also update hash to match sourceforge (original) one.
> 
> And rename patch to new naming convention.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> diff --git a/package/haserl/0.9.33/haserl-001-add-haserl_lualib.inc.patch b/package/haserl/0001-add-haserl_lualib.inc.patch
> similarity index 100%
> rename from package/haserl/0.9.33/haserl-001-add-haserl_lualib.inc.patch
> rename to package/haserl/0001-add-haserl_lualib.inc.patch
> diff --git a/package/haserl/Config.in b/package/haserl/Config.in
> index 680e280..1620d72 100644
> --- a/package/haserl/Config.in
> +++ b/package/haserl/Config.in
> @@ -8,37 +8,9 @@ config BR2_PACKAGE_HASERL
>  
>  	  http://haserl.sourceforge.net/
>  
> -if BR2_PACKAGE_HASERL
> -
>  config BR2_PACKAGE_HASERL_WITH_LUA
>  	bool "Lua support"
> -	depends on BR2_PACKAGE_HASERL_VERSION_0_9_X
> +	depends on BR2_PACKAGE_HASERL
>  	select BR2_PACKAGE_LUA

The Lua package is a provider for the virtual package LUAINTERPRETER.
We must not select a provider, we can only depend on it.

Care to fix that while you're at it, please?

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
