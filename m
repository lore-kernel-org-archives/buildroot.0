From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Jan 2013 16:24:53 +0100
Subject: [Buildroot] [PATCH RFC 3/6] firmware-imx: new package
In-Reply-To: <1355960256-10786-4-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Thu, 20 Dec 2012 00:37:33 +0100")
References: <1355960256-10786-1-git-send-email-arnout@mind.be>
 <1355960256-10786-4-git-send-email-arnout@mind.be>
Message-ID: <87obgrss6y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Arnout> ---
 Arnout>  package/Config.in                    |    1 +
 Arnout>  package/firmware-imx/Config.in       |   13 ++++++++++++
 Arnout>  package/firmware-imx/firmware-imx.mk |   38 ++++++++++++++++++++++++++++++++++
 Arnout>  3 files changed, 52 insertions(+)
 Arnout>  create mode 100644 package/firmware-imx/Config.in
 Arnout>  create mode 100644 package/firmware-imx/firmware-imx.mk

 Arnout> diff --git a/package/Config.in b/package/Config.in
 Arnout> index ac2488e..52bb408 100644
 Arnout> --- a/package/Config.in
 Arnout> +++ b/package/Config.in
 Arnout> @@ -213,6 +213,7 @@ source "package/eeprog/Config.in"
 Arnout>  source "package/evtest/Config.in"
 Arnout>  source "package/flashrom/Config.in"
 Arnout>  source "package/fconfig/Config.in"
 Arnout> +source "package/firmware-imx/Config.in"

I moved this under the new Misc devices firmware menu.


 Arnout> +define FIRMWARE_IMX_INSTALL_TARGET_CMDS
 Arnout> +	for blobdir in $(FIRMWARE_IMX_BLOBS); do \
 Arnout> +		cp -r $(@D)/firmware/$${blobdir} $(TARGET_DIR)/lib/firmware; \
 Arnout> +	done
 Arnout> +endef

And stuck a mkdir -p $(TARGET_DIR)/lib/firmware here to ensure it's
available.

-- 
Bye, Peter Korsgaard
