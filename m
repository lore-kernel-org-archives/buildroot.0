From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 31 Oct 2008 00:31:36 -0200
Subject: [Buildroot] [PATCH] qtopia4: fix wrong variable name for SQL
In-Reply-To: <200810310118.50847.markus.heidelberg@web.de>
References: <200810310118.50847.markus.heidelberg@web.de>
Message-ID: <d6cda7730810301931q61359abdva18447d940267043@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks.
Applied in r23872.

Btw, could you send patches as attachments (instead or as well)? Not
sure how others prefers them, but since I don't view my mail on linux
boxes and only use linux through ssh I sort of have to apply them by
typing it back on the ssh window. Also, I don't trust copy and paste
to not mess with the whitespaces and tabs.... If I do mess them up
others jump on my neck. Whitespace damage is sort of worst than having
a non working package around here *smile*.

Anyway, thanks for spoting that. Sorry for my laziness.

Kind Regards,
   Thiago A. Correa

On Thu, Oct 30, 2008 at 10:18 PM, Markus Heidelberg
<markus.heidelberg@web.de> wrote:
> Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
> ---
>  package/qtopia4/qtopia4.mk |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/package/qtopia4/qtopia4.mk b/package/qtopia4/qtopia4.mk
> index 9c08be9..de3bf4d 100644
> --- a/package/qtopia4/qtopia4.mk
> +++ b/package/qtopia4/qtopia4.mk
> @@ -307,7 +307,7 @@ endif
>                cp -dpfr $(STAGING_DIR)/usr/plugins/imageformats $(TARGET_DIR)/usr/plugins/; \
>                $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/plugins/imageformats/*; \
>        fi
> -ifneq ($(BR2_PACKAGE_QTOPIA4_SQL),y)
> +ifneq ($(BR2_PACKAGE_QTOPIA4_SQL_MODULE),y)
>        # Remove Sql libraries, not needed
>        -rm $(TARGET_DIR)/usr/lib/libQtSql*
>  endif
> --
> 1.6.0.3.524.g3adb7d
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
