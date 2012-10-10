From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Oct 2012 23:22:25 +0200
Subject: [Buildroot] [PATCH 02/11] e2fsprogs: add staging install
In-Reply-To: <1342963719-1810-3-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 22 Jul 2012 15:28:30 +0200")
References: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
 <1342963719-1810-3-git-send-email-s.martin49@gmail.com>
Message-ID: <87mwzu58fi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Why? As far as I can see we don't have anything depending on e2fsprogs,
and the libuuid stuff moved to util-linux, didn't it?


 Samuel> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
 Samuel> index 16725ac..036e54e 100644
 Samuel> --- a/package/e2fsprogs/e2fsprogs.mk
 Samuel> +++ b/package/e2fsprogs/e2fsprogs.mk
 Samuel> @@ -26,6 +26,9 @@ E2FSPROGS_DEPENDENCIES = host-pkg-config util-linux
 Samuel>  E2FSPROGS_MAKE_OPT = \
 Samuel>  	LDCONFIG=true
 
 Samuel> +E2FSPROGS_INSTALL_STAGING = YES
 Samuel> +E2FSPROGS_INSTALL_STAGING_OPT += install install-libs DESTDIR=$(STAGING_DIR)
 Samuel> +
 Samuel>  define HOST_E2FSPROGS_INSTALL_CMDS
 Samuel>   $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install install-libs
 Samuel>  endef
 Samuel> -- 
 Samuel> 1.7.11.2

 Samuel> _______________________________________________
 Samuel> buildroot mailing list
 Samuel> buildroot at busybox.net
 Samuel> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
