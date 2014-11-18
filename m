From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Nov 2014 21:35:01 +0100
Subject: [Buildroot] [PATCH v4 1/4] libatomic_ops: Add
 host-autotools-package
In-Reply-To: <1415310486-25904-2-git-send-email-paguilar@paguilar.org>
References: <1415310486-25904-1-git-send-email-paguilar@paguilar.org>
 <1415310486-25904-2-git-send-email-paguilar@paguilar.org>
Message-ID: <20141118203501.GI4333@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pedro, All,

Eventually, I get to review this... ;-)

On 2014-11-06 22:48 +0100, Pedro Aguilar spake thusly:
> The host-libatomic_ops is needed by host-bdwgc that is needed
> in turn by guile.
> 
> bdwgc bundles its own version of libatomic_ops, but it's prefered
> to use the external one that is the default.

That sentence is not obvious for who hasn;t followed the previous
iterations of the series. Also, it is related to bdwgc, so is not
needed in that patch. Let;s just remove it.

> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

With the second sentence removed from the commit log:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
> Changes v1 -> v2:
> - Add host-libatomic_ops (suggested by Yann Morin)
> 
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

That second SoB line is superfluous, and will be ignored by git.
Basically, all that is below the '---' line (included) gets ignored by
git when applying a patch.

Regards,
Yann E. MORIN.

> ---
>  package/libatomic_ops/libatomic_ops.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
> index d473901..6a26775 100644
> --- a/package/libatomic_ops/libatomic_ops.mk
> +++ b/package/libatomic_ops/libatomic_ops.mk
> @@ -20,3 +20,4 @@ LIBATOMIC_OPS_LICENSE_FILES = doc/LICENSING.txt COPYING
>  LIBATOMIC_OPS_INSTALL_STAGING = YES
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> -- 
> 1.9.1
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
