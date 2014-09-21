From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 21:13:35 +0200
Subject: [Buildroot] [PATCH 02/23 v5] gendoc infra: move manual build
 location into $(BUILD_DIR)/manual
In-Reply-To: <6434392afa05cfca43f02e7f2e79671fe175f059.1410692670.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <6434392afa05cfca43f02e7f2e79671fe175f059.1410692670.git.yann.morin.1998@free.fr>
Message-ID: <20140921211335.25ce7865@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 14 Sep 2014 13:07:36 +0200, Yann E. MORIN wrote:

> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> index 136f725..e86f872 100644
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -1,11 +1,20 @@
> +$(BUILD_DIR)/$(pkgname):
> +	$(Q)mkdir -p $@

Shouldn't we do things in $(BUILD_DIR)/docs/$(pkgname) instead? Even
though it's unlikely, I'm a bit worried about conflicting names between
real packages and documentations.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
