From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:07:08 +0100
Subject: [Buildroot] [PATCHv3 33/74] iostat: remove legacy code
In-Reply-To: <1417357142-14307-34-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-34-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130170708.GM4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> Some custom iostat-source target was mistakenly left in place when the
> iostat package was migrated to gentargets in commit
> ee77963588b09babfd71befb0b5eb9fd1e776bbc, back 4 years ago. This
> commit removes this unnecessary custom target.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

That is a really hard forensic work you've been doing in this series!

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/iostat/iostat.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
> index 2080e56..dd2a579 100644
> --- a/package/iostat/iostat.mk
> +++ b/package/iostat/iostat.mk
> @@ -9,8 +9,6 @@ IOSTAT_SITE = http://www.linuxinsight.com/files
>  IOSTAT_LICENSE = GPL
>  IOSTAT_LICENSE_FILES = LICENSE
>  
> -iostat-source: $(DL_DIR)/$(IOSTAT_SOURCE)
> -
>  define IOSTAT_BUILD_CMDS
>  	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
>  endef
> -- 
> 2.1.0
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
