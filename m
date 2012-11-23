From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 Nov 2012 10:10:22 +0100
Subject: [Buildroot] [PATCH 06/33] sylpheed: fix build disabling gpgme
	support
In-Reply-To: <1353543503-8952-7-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Thu, 22 Nov 2012 01:17:56 +0100")
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-7-git-send-email-s.martin49@gmail.com>
Message-ID: <87d2z4fzwh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Samuel> ---
 Samuel>  package/sylpheed/sylpheed.mk | 2 +-
 Samuel>  1 file changed, 1 insertion(+), 1 deletion(-)

 Samuel> diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
 Samuel> index cf55c90..3ac2e1e 100644
 Samuel> --- a/package/sylpheed/sylpheed.mk
 Samuel> +++ b/package/sylpheed/sylpheed.mk
 Samuel> @@ -9,7 +9,7 @@ SYLPHEED_VERSION = $(SYLPHEED_VERSION_MAJOR).$(SYLPHEED_VERSION_MINOR)
 Samuel>  SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.bz2
 Samuel>  SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
 
 Samuel> -SYLPHEED_CONF_OPT = --disable-gtkspell
 Samuel> +SYLPHEED_CONF_OPT = --disable-gtkspell --disable-gpgme

Why? Does it pick up libgpgme from the host?

It would be good if you could write a bit more detailed commit messages.

 
 Samuel>  SYLPHEED_DEPENDENCIES = host-pkgconf libgtk2
 
 Samuel> -- 
 Samuel> 1.8.0

 Samuel> _______________________________________________
 Samuel> buildroot mailing list
 Samuel> buildroot at busybox.net
 Samuel> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
