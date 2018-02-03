From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Feb 2018 18:17:47 +0100
Subject: [Buildroot] [PATCH] package/lynx: depends on dynamic lib
In-Reply-To: <20180203170555.1431-1-mlang@blind.guru>
References: <20180203170555.1431-1-mlang@blind.guru>
Message-ID: <20180203171747.GP2369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mario, All,

On 2018-02-03 18:05 +0100, Mario Lang spake thusly:
> diff --git a/package/lynx/Config.in b/package/lynx/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LYNX
>  	bool "lynx"
> +	depends on !BR2_STATIC_LIBS
>  	depends on BR2_USE_MMU

Software dependencies (!static) should go after hardware dependencies
(here, MMU).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
