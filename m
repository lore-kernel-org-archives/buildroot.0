From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 11 Feb 2014 13:09:24 +0100
Subject: [Buildroot] [pkg-perl infra V7 6/6] perl: remove
	PERL_INSTALL_TARGET_GOALS
In-Reply-To: <1392116205-12810-7-git-send-email-francois.perrad@gadz.org>
References: <1392116205-12810-1-git-send-email-francois.perrad@gadz.org>
 <1392116205-12810-7-git-send-email-francois.perrad@gadz.org>
Message-ID: <CAAXf6LVm50G9s=TjpuU--FxBZnCfUUzo031o6YSTBrnD9Vb1kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 11, 2014 at 11:56 AM, Francois Perrad <fperrad@gmail.com> wrote:
> useless since previous commit (removal of BR2_HAVE_DOCUMENTATION)
> see http://git.buildroot.net/buildroot/diff/package/perl/perl.mk?id=7164a32632d14cb83698ddec45e84ad2f3252e9e
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl/perl.mk |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index 5ede81b..51aeb14 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -90,10 +90,8 @@ define PERL_INSTALL_STAGING_CMDS
>         $(MAKE1) -C $(@D) DESTDIR="$(STAGING_DIR)" install.perl
>  endef
>
> -PERL_INSTALL_TARGET_GOALS = install.perl
> -
>  define PERL_INSTALL_TARGET_CMDS
> -       $(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" $(PERL_INSTALL_TARGET_GOALS)
> +       $(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" install.perl
>  endef
>
>  $(eval $(generic-package))

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
