From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Feb 2014 09:25:04 +0100
Subject: [Buildroot] [PATCH V5 3/3] i.MX: use temp directory for
 Freescale self-extractors
In-Reply-To: <1392337580-16568-4-git-send-email-eric.nelson@boundarydevices.com>
References: <1392337580-16568-1-git-send-email-eric.nelson@boundarydevices.com>
 <1392337580-16568-4-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <20140214092504.63c32cfc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Nelson,

On Thu, 13 Feb 2014 17:26:20 -0700, Eric Nelson wrote:

> +		sh $(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE) --force --auto-accept ; \
> +		mv $(GPU_VIV_BIN_MX6Q_EXTRACT)/* ./ ; \
> +		rm -rf $(GPU_VIV_BIN_MX6Q_EXTRACT)/)

I must say I would prefer if there was no slash at the end here, so
that if the GPU_VIV_BIN_MX6Q_EXTRACT variable is empty (for example due
to a bug in the package, or due to changes being made to the package
that make it non-working) it doesn't do a rm -rf /.

I'd go even further: if the directory is empty, then is a simple
"rmdir" should do the trick, and is a lot less disastrous than a "rm
-rf" should something go wrong with the argument that is passed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
