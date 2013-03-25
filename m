From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 25 Mar 2013 23:44:30 +0100
Subject: [Buildroot] [PATCH 2/4] Support .dotfiles in / being copied to
	the TARGET
In-Reply-To: <1364222893-23858-2-git-send-email-arved@arved.at>
 (arved@arved.at's message of "Mon, 25 Mar 2013 15:48:11 +0100")
References: <1364222893-23858-1-git-send-email-arved@arved.at>
 <1364222893-23858-2-git-send-email-arved@arved.at>
Message-ID: <87ppyn9k1d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "arved" == arved  <arved@arved.at> writes:

 arved> From: Tilman Keskin?z <arved@arved.at>
 arved> An example is .init_enable_core, to enable coredumps in busybox
 arved> Signed-off-by: Tilman Keskin?z <arved@arved.at>
 arved> ---
 arved>  Makefile |    2 +-
 arved>  1 file changed, 1 insertion(+), 1 deletion(-)

 arved> diff --git a/Makefile b/Makefile
 arved> index f1c98aa..62311ed 100644
 arved> --- a/Makefile
 arved> +++ b/Makefile
 arved> @@ -431,7 +431,7 @@ $(BUILD_DIR)/.root:
 arved>  	mkdir -p $(TARGET_DIR)
 arved>  	if ! [ -d "$(TARGET_DIR)/bin" ]; then \
 arved>  		if [ -d "$(TARGET_SKELETON)" ]; then \
 arved> -			cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
 arved> +			rsync -au $(TARGET_SKELETON)/ $(TARGET_DIR)/; \

Committed, thanks.

-- 
Bye, Peter Korsgaard
