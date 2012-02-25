From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 25 Feb 2012 23:20:08 +0100
Subject: [Buildroot] [PATCH] Makefile: remove toolchainfile.cmake on
	'make clean'
In-Reply-To: <1329754296-3895-1-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Mon, 20 Feb 2012 17:11:36 +0100")
References: <1329754296-3895-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87sjhyzhbb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
 Sven> ---
 Sven>  Makefile |    3 ++-
 Sven>  1 files changed, 2 insertions(+), 1 deletions(-)

 Sven> diff --git a/Makefile b/Makefile
 Sven> index 428084b..25bb8f2 100644
 Sven> --- a/Makefile
 Sven> +++ b/Makefile
 Sven> @@ -626,7 +626,8 @@ endif
 
 Sven>  clean:
 Sven>  	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
 Sven> -		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging
 Sven> +		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) \
 Sven> +		$(BASE_DIR)/staging $(BASE_DIR)/toolchainfile.cmake

Thanks, but I prefer to move the file somewhere more sane as has been
discussed several times. I've just committed a patch to -next which
moves it to HOST_DIR/usr/share/buildroot, so this is no longer needed.

-- 
Bye, Peter Korsgaard
