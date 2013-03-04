From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Mar 2013 21:04:15 +0100
Subject: [Buildroot] [PATCH] <pkg>-rsync: exclude version control files
In-Reply-To: <f9ac20b69b1bfd3f77ef.1362169598@BEANTN0L019720> (Thomas De
 Schampheleire's message of "Fri, 01 Mar 2013 21:26:38 +0100")
References: <f9ac20b69b1bfd3f77ef.1362169598@BEANTN0L019720>
Message-ID: <871ubv9bk0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> When using rsync to import package sources (typically with
 Thomas> PKG_OVERRIDE_SRCDIR), it often happens that these external sources
 Thomas> are under version control, and contain directories like .git,
 Thomas> .hg, etc.

 Thomas> Depending on the project, these directories can become pretty large
 Thomas> and typically have a lot of files. Moreover, they are not necessary
 Thomas> in the context of building the package. Therefore, this commit adds
 Thomas> the --cvs-exclude option to the rsync call, saving both disk space
 Thomas> and sync time.

I don't personally use this, but doesn't that break stuff using the
version info (like E.G. the kernel storing the git id)?


 Thomas> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 Thomas> ---
 Thomas>  package/pkg-generic.mk |  2 +-
 Thomas>  1 files changed, 1 insertions(+), 1 deletions(-)

 Thomas> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
 Thomas> --- a/package/pkg-generic.mk
 Thomas> +++ b/package/pkg-generic.mk
 Thomas> @@ -62,7 +62,7 @@ endif
 Thomas>  $(BUILD_DIR)/%/.stamp_rsynced:
 Thomas>  	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
 Thomas>  	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
 Thomas> -	rsync -au $(SRCDIR)/ $(@D)
 Thomas> +	rsync -au --cvs-exclude $(SRCDIR)/ $(@D)
 Thomas>  	$(Q)touch $@
 
 Thomas>  # Handle the SOURCE_CHECK and SHOW_EXTERNAL_DEPS cases for rsynced
 Thomas> _______________________________________________
 Thomas> buildroot mailing list
 Thomas> buildroot at busybox.net
 Thomas> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
