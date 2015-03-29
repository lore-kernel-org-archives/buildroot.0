From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2015 23:47:39 +0200
Subject: [Buildroot] [PATCH 11/35] pkg-generic: implement
 <pkg>-all-{source, legal-info, external-deps} targets
In-Reply-To: <1427650429-9293-12-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1427650429-9293-12-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150329214739.GL4093@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-29 19:33 +0200, Thomas Petazzoni spake thusly:
> In order to implement the global 'make source', 'make legal-info' and
> 'make external-deps' using the package infrastructure logic, this
> commit introduces a set of per-package targets that allow to
> recursively run the source/legal-info/external-deps actions on the
> dependencies of a given package.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-generic.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 08e4cad..ba24591 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -587,6 +587,12 @@ $(1)-graph-depends: graph-depends-requirements
>  			|tee $$(O)/graphs/$$(@).dot \
>  			|dot $$(BR2_GRAPH_DOT_OPTS) -T$$(BR_GRAPH_OUT) -o $$(O)/graphs/$$(@).$$(BR_GRAPH_OUT)
>  
> +$(1)-all-source:       $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-source) $(1)-source
> +
> +$(1)-all-external-deps:        $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-external-deps) $(1)-external-deps
> +
> +$(1)-all-legal-info:   $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-all-legal-info) $(1)-legal-info
> +
>  $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
>  
>  $(1)-clean-for-reinstall:
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
