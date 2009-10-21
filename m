From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Oct 2009 10:16:35 +0200
Subject: [Buildroot] [PATCH 1/2] libnl: handle all installed libraries
In-Reply-To: <1255988758-4787-1-git-send-email-s.neumann@raumfeld.com> (Sven
	Neumann's message of "Mon\, 19 Oct 2009 23\:45\:58 +0200")
References: <1255988758-4787-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87zl7lqhzw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> libnl does not only install libnl.so, but also libnl-nf.so,
 Sven> libnl-genl.so and libnl-route.so. Change the post-install
 Sven> and uninstall hooks to handle these libraries as well.

 Sven> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
 Sven> ---
 Sven>  package/libnl/libnl.mk |    2 ++
 Sven>  1 files changed, 2 insertions(+), 0 deletions(-)

 Sven> diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
 Sven> index 1a66746..b9224f2 100644
 Sven> --- a/package/libnl/libnl.mk
 Sven> +++ b/package/libnl/libnl.mk
 Sven> @@ -14,9 +14,11 @@ $(eval $(call AUTOTARGETS,package,libnl))
 
 Sven>  $(LIBNL_HOOK_POST_INSTALL): $(LIBNL_TARGET_INSTALL_TARGET)
 Sven>  	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libnl.so*
 Sven> +	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libnl-*.so*

This should be surrounded by ifneq ($(BR2_ENABLE_DEBUG),y) - But, I'll
fix that myself - Committed.

-- 
Bye, Peter Korsgaard
