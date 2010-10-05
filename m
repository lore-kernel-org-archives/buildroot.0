From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Oct 2010 11:21:47 +0200
Subject: [Buildroot] [PATCH 05/10] microcom: convert to gentargets
In-Reply-To: <1286266963-23413-5-git-send-email-Martin.Banky@gmail.com>
References: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
	<1286266963-23413-5-git-send-email-Martin.Banky@gmail.com>
Message-ID: <20101005112147.2bc80d0e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 Oct 2010 01:22:38 -0700
Martin Banky <martin.banky@gmail.com> wrote:

> +define MICROCOM_CONFIGURE_CMDS
> +	$(ZCAT) $(DL_DIR)/$(MICROCOM_SOURCE) | tar -C $(@D) $(TAR_OPTIONS) -

This sounds strange to me. The extraction is already done by the
package infrastructure.

>  	toolchain/patch-kernel.sh $(MICROCOM_DIR) package/microcom/ \*.patch

This as well.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
