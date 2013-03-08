From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Mar 2013 18:09:45 +0100
Subject: [Buildroot] [PATCH 1/2] packages: add ability for packages to
	create users
In-Reply-To: <c0d34eb619bf008b8624b1df54690dc75c7b64af.1362692613.git.yann.morin.1998@free.fr>
References: <cover.1362692613.git.yann.morin.1998@free.fr>
 <c0d34eb619bf008b8624b1df54690dc75c7b64af.1362692613.git.yann.morin.1998@free.fr>
Message-ID: <201303081809.45387.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

On Thursday 07 March 2013 Yann E. MORIN wrote:
> Packages that install daemons may need those daemons to run as a non-root,
> or an otherwise non-system (eg. 'daemon'), user.
> 
> Add infrastructure for packages to create users, by declaring the FOO_USERS
> variable that contain a makedev-syntax-like description of the user(s) to
> add.
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index a615ae2..fc6ea30 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -53,7 +53,12 @@ system is based on hand-written Makefiles or shell scripts.
>  36:	/bin/foo  f  4755  0  0	 -  -  -  -  -
>  37: endef
>  38:
> -39: $(eval $(generic-package))
> +39: define LIBFOO_USERS
> +40:	foo -1 libfoo -1 * - - - LibFoo daemon
> +41: endef
> +42:
> +43: $(eval $(generic-package))
> +>>>>>>> packages: add ability for packages to create users

Apparently, I was not careful enough when resolving the conflicts during
the rebase. Will fix and re-submit in the WE.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
