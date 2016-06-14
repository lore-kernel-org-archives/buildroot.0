From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jun 2016 21:42:16 +0200
Subject: [Buildroot] [PATCH 1/5] wireshark: remove documentation
In-Reply-To: <1465917079-30473-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614151017.GG3060@hermes.click-hack.org>
 <1465917079-30473-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160614194216.GC3759@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gilles, All,

On 2016-06-14 17:11 +0200, Gilles Chanteperdrix spake thusly:
> Remove html and txt documentation from the rootfs as they unlikely to be
> needed.
> 
> Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> ---
>  package/wireshark/wireshark.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index c7bf6c2..23996a3 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -99,4 +99,10 @@ else
>  WIRESHARK_CONF_OPTS += --with-sbc=no
>  endif
>  
> +define WIRESHARK_REMOVE_DOCS
> +	find $(TARGET_DIR)/usr/share/wireshark -\( -name '*.txt' -o -name '*.html' -\) -delete

The slight change that I'd suggest (not request!) is to not add a dash
in front of the commas, since it is not even talked about in find's
manpage.

Otherwise:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +endef
> +
> +WIRESHARK_POST_INSTALL_TARGET_HOOKS += WIRESHARK_REMOVE_DOCS
> +
>  $(eval $(autotools-package))
> -- 
> 2.8.2
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
