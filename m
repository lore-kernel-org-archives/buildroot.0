From: Alexander Dahl <post@lespocky.de>
Date: Tue, 8 Jun 2021 07:09:22 +0200
Subject: [Buildroot] [PATCH/stable] package/putty: Ignore CVE-2021-33500
In-Reply-To: <20210601070316.27441-1-post@lespocky.de>
References: <20210601070316.27441-1-post@lespocky.de>
Message-ID: <20210608050921.tm7q7miatnfyy3v7@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

since I get autobuilder warning mails every Monday for CVE-2021-33500
now, I kindly wanted to ask, if this is the right approach?

That CVE only affects Windows, master has putty 0.75 which has that
fixed already. So I thought it would not be necessary to backport 0.75
to the stable branch(es), but ignore that CVE in stable branches only?

Greets
Alex

On Tue, Jun 01, 2021 at 09:03:16AM +0200, Alexander Dahl wrote:
> Since putty is only affected by this CVE on Windows, ignore it in the
> stable branch.  Branch master is not affected anymore already, due to
> newer version which got fixed.
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
>  package/putty/putty.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/putty/putty.mk b/package/putty/putty.mk
> index c40cac9dc5..8a494d4e54 100644
> --- a/package/putty/putty.mk
> +++ b/package/putty/putty.mk
> @@ -12,6 +12,9 @@ PUTTY_CPE_ID_VENDOR = putty
>  PUTTY_CONF_OPTS = --disable-gtktest
>  PUTTY_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -Wno-error"
>  
> +# Windows only, fixed for Windows with 0.75
> +PUTTY_IGNORE_CVES += CVE-2021-33500
> +
>  ifeq ($(BR2_PACKAGE_LIBGTK2),y)
>  PUTTY_CONF_OPTS += --with-gtk=2
>  PUTTY_DEPENDENCIES += libgtk2
> 
> base-commit: 677b20cf240d099e1bfc1d50e54730083618d24f
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210608/0e331e5a/attachment.asc>
