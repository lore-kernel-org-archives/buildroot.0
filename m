From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 22 Mar 2013 09:24:24 +0100
Subject: [Buildroot] [PATCH] <pkg>-rsync: Reincluding core files and
 folders, which got kicked out by --cvs-exclude option.
In-Reply-To: <EE4E4767751A8B40949306E403F4DDD802D6D365@sv03ultra002.ultratronik.de>
References: <EE4E4767751A8B40949306E403F4DDD802D6D365@sv03ultra002.ultratronik.de>
Message-ID: <CAAXf6LXRx==TDAA-tKwaY=HKC3b0dd6Kq=Gs3eEiC6QA_srnmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 22, 2013 at 8:53 AM, Naumann Andreas <ANaumann@ultratronik.de>wrote:

> The --cvs-exclude option also excludes 'core', which when rsyncing e.g.
> a linux tree is less than optimal..
>
>

You'll need to put a Signed-off-by line here.

You can also immediately add:
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>



---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 8d964a1..595ad1b 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -62,7 +62,7 @@ $(BUILD_DIR)/%/.stamp_extracted:
>  $(BUILD_DIR)/%/.stamp_rsynced:
>         @$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
>         @test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ;
> exit 1)
> -       rsync -au --cvs-exclude $(SRCDIR)/ $(@D)
> +       rsync -au --cvs-exclude --include core $(SRCDIR)/ $(@D)
>         $(Q)touch $@
>
>  # Handle the SOURCE_CHECK and SHOW_EXTERNAL_DEPS cases for rsynced
> --
> 1.8.1.1
>
>
> end
>
>
> ------------------------------------------------------------------------------
> Dipl.-Ing. (FH)
> Andreas Naumann
> Embedded Software
> T +49 8105 77839-363
> F +49 8105 77839-850
> ANaumann at ultratronik.de
> www.ultratronik.de
> Dornierstra?e 9
> 82205 Gilching
> ULTRATRONIK
> L?SUNGEN F?R IHREN ERFOLG - SOLUTIONS FOR YOUR SUCCESS
>
>
> ------------------------------------------------------------------------------
> Gesch?ftsf?hrer: Dipl.-Ing. Wolfgang Sorg, Dipl.-Kfm. Alexander Sorg
> Sitz der Gesellschaft: Gilching
> Registergericht M?nchen HRB 49567 (Ultratronik Vertriebs GmbH)
> Registergericht M?nchen HRB 55584 (Ultratronik GmbH)
>
>
> ------------------------------------------------------------------------------
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130322/a3187f37/attachment.html>
