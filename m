From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Mar 2012 15:41:26 +0100
Subject: [Buildroot] [PATCHv2 1/2] Add lpc3250loader to the host tools
In-Reply-To: <1328612486-7770-1-git-send-email-alexandre.belloni@piout.net>
 (Alexandre Belloni's message of "Tue, 7 Feb 2012 12:01:25 +0100")
References: <1328612486-7770-1-git-send-email-alexandre.belloni@piout.net>
Message-ID: <87bonunf8p.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexandre" == Alexandre Belloni <alexandre.belloni@piout.net> writes:

 Alexandre> Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
 Alexandre> ---
 Alexandre>  package/Config.in.host                 |    1 +
 Alexandre>  package/lpc3250loader/Config.in.host   |    7 +++++++
 Alexandre>  package/lpc3250loader/lpc3250loader.mk |    9 +++++++++
 Alexandre>  3 files changed, 17 insertions(+), 0 deletions(-)
 Alexandre>  create mode 100644 package/lpc3250loader/Config.in.host
 Alexandre>  create mode 100644 package/lpc3250loader/lpc3250loader.mk

Committed, thanks.

 Alexandre> +define HOST_LPC3250LOADER_INSTALL_CMDS
 Alexandre> +	mkdir -p $(HOST_DIR)/usr/bin/
 Alexandre> +	cp -a $(@D)/* $(HOST_DIR)/usr/bin/

We normally use install -D for installation, so I changed this.

-- 
Bye, Peter Korsgaard
