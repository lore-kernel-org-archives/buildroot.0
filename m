From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 May 2015 17:07:05 +0200
Subject: [Buildroot] [PATCHv6] system: allow/disallow root login,
 accept encoded passwords
In-Reply-To: <55460D22.40101@sancho.ccd.uniroma2.it>
References: <1430602215-20128-1-git-send-email-yann.morin.1998@free.fr>
 <55460D22.40101@sancho.ccd.uniroma2.it>
Message-ID: <20150503150705.GB4154@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lorenzo, All,

On 2015-05-03 13:57 +0200, Lorenzo M. Catucci spake thusly:
> Yann,
> 
> 	I've had to insert the following fixup patch to import your v6 into master:
> 
> diff --git a/system/system.mk b/system/system.mk
> index 4a1eb4a..c95e436 100644
> --- a/system/system.mk
> +++ b/system/system.mk
> @@ -35,7 +35,7 @@ TARGET_FINALIZE_HOOKS += SYSTEM_ISSUE
>  endif
> 
>  ifneq ($(TARGET_GENERIC_ROOT_PASSWD),)
> -TARGETS += host-mkpasswd
> +PACKAGES += host-mkpasswd

I don't understand: this is already th4e case in the v6 I sent:
    https://patchwork.ozlabs.org/patch/467351/

>  endif
> 
>  define SET_NETWORK_LOCALHOST
> 
> 
> While I concur with Arnout's call for moving that line just before the
> $(shell $(MKPASSWD) call, I can confirm both

OK, I'll move it.

> Tested-by: "Lorenzo M. Catucci" <lorenzo@sancho.ccd.uniroma2.it>
> Acked-by: "Lorenzo M. Catucci" <lorenzo@sancho.ccd.uniroma2.it>
> 
> As for Arnout's suggestion about "config BR2_TARGET_ENABLE_ROOT_LOGIN", I'd
> replace the "Enable root login password" with "Enable console interactive root
> login", and then go on to explain there can be other login means like
> authorized ssh keys or sudo.

Well, it's not only console, it can also be via ssh.

I've changed the boolean prompt to:
    bool "Enable root login with password"

and the help text to:

    Allow root to log in with a password.

    If not enabled, root will not be able to log in with a password.
    However, if you have an ssh server and you add an ssh key, you
    can still allow root to log in. Alternatively, you can use sudo
    to become root.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
