From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 May 2011 20:43:32 +0200
Subject: [Buildroot] [PATCH] Makefile.package.in: Makes it possible to
 override the default extract commands
In-Reply-To: <1305027254-21565-2-git-send-email-a@awn.dk>
References: <1305027254-21565-1-git-send-email-a@awn.dk>
	<1305027254-21565-2-git-send-email-a@awn.dk>
Message-ID: <20110510204332.62afd066@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Allan,

On Tue, 10 May 2011 13:34:14 +0200
"Allan W. Nielsen" <a@awn.dk> wrote:

> --- PACKAGE BEGIN ---

Please don't use --- at the beginning of a line in your commit message.
Git believes that the rest of the message shouldn't be included in the
commit message when applying your patch.

> +# default extract command
> +$(2)_EXTRACT_CMDS ?= $(if $($(2)_SOURCE),$(INFLATE$(suffix $($(2)_SOURCE))) $(DL_DIR)/$($(2)_SOURCE) | \
> +	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $(TAR_OPTIONS) -)

Hm, this is not some nice. I'm currently testing your patch, I'll see
if I find a better way of writing this.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
