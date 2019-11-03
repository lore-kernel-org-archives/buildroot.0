From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Nov 2019 10:34:47 +0100
Subject: [Buildroot] [PATCH] package/dtc: do not install headers for the
 host version
In-Reply-To: <20191102122947.8231-1-unixmania@gmail.com>
References: <20191102122947.8231-1-unixmania@gmail.com>
Message-ID: <20191103093447.GF2710@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2019-11-02 09:29 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
[--SNIP--]
>  define HOST_DTC_INSTALL_CMDS
> -	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(HOST_DTC_MAKE_OPTS) install
> +	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(HOST_DTC_MAKE_OPTS) install-bin install-lib

Besides the fact that some host packages do require the headers (as
explained in my previous reply), there is a more profound issue here:
what is even the point in installing the library if its headers are not
installed?

Either the library is used, in which case we have to also install the
headers, or the library is not used, in which case we should just
install the program(s).

But the library is used by external programs, like host-qemu, and maybe
also by programs in br2-external trees.

So, I'm even less convinced by this change now than I was yesterday...

Regards,
Yann E. MORIN.

>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.18.1
> 
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
