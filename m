From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 5 Dec 2011 22:33:51 +0100
Subject: [Buildroot] [PATCH 2/4] Supply better default uClibc config
	file when using ct-ng
In-Reply-To: <1323108498-2398-3-git-send-email-will_wagner@carallon.com>
References: <1323108498-2398-1-git-send-email-will_wagner@carallon.com>
 <1323108498-2398-3-git-send-email-will_wagner@carallon.com>
Message-ID: <201112052233.51317.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will, Gustavo, All,

On Monday 05 December 2011 19:08:16 Will Wagner wrote:
> Signed-off-by: Will Wagner <will_wagner@carallon.com>
> ---
>  toolchain/toolchain-crosstool-ng/Config.in       |    4 +
>  toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    2 +-
>  toolchain/toolchain-crosstool-ng/uClibc.config   |  246 ----------------------
>  3 files changed, 5 insertions(+), 247 deletions(-)
>  delete mode 100644 toolchain/toolchain-crosstool-ng/uClibc.config
> 
> diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
> index e774caf..bc14d75 100644
> --- a/toolchain/toolchain-crosstool-ng/Config.in
> +++ b/toolchain/toolchain-crosstool-ng/Config.in
> @@ -64,6 +64,10 @@ choice
>  
>  endchoice
>  
> +config BR2_TOOLCHAIN_CTNG_uClibc_CONFIG
> +	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30

Will and Gustavo, please coordinate with each other:

 - Will wants to reference that file to commonalise the uClibc configuration
   files between the internal backend and the crosstool-NG backend, see:
      http://lists.busybox.net/pipermail/buildroot/2011-December/048123.html

 - Gustavo wants to remove the file because the internal toolchain backend
   is dropping support for uClibc-0.9.30; see:
      http://lists.busybox.net/pipermail/buildroot/2011-December/048099.html

I am not sure what the proper resolution could be. Surely enough, I think
what Will wants to do is the correct way: use a single (set of) files for
both backends. Also, the internal backend should not be impacted by some
requirements of the ct-ng backend.

Anyway, in the meantime, because Gustavo's patch is not yet applied...
Will, you can add my:
    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
