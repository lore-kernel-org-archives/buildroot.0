From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Mar 2014 23:58:23 +0100
Subject: [Buildroot] [PATCH v6 2/6] Makefile: add $(HOST_DIR)/sbin to
 BR_PATH
In-Reply-To: <1394373623-10650-3-git-send-email-s.martin49@gmail.com>
References: <1394373623-10650-1-git-send-email-s.martin49@gmail.com>
 <1394373623-10650-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20140309225823.GC3194@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-03-09 15:00 +0100, Samuel Martin spake thusly:
> Extend BR_PATH because a few host-packages install programs in this
> location.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[--SNIP--]
> diff --git a/Makefile b/Makefile
> index 1329ada..f815b93 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -330,7 +330,7 @@ TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
>  HOST_DIR:=$(call qstrip,$(BR2_HOST_DIR))
>  
>  # Quotes are needed for spaces and all in the original PATH content.
> -BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"
> +BR_PATH:="$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"

As seen on IRC, there's still a glitch on that line: it should be using
a plain = not a :=

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
