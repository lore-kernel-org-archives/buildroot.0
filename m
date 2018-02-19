From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Feb 2018 21:22:13 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/llvm: new host package
In-Reply-To: <20180219171805.13769-2-valentin.korenblit@smile.fr>
References: <20180219171805.13769-1-valentin.korenblit@smile.fr>
 <20180219171805.13769-2-valentin.korenblit@smile.fr>
Message-ID: <20180219212213.33f289c4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have by far not reviewed everything, but noticed one problem.

On Mon, 19 Feb 2018 18:18:03 +0100, Valentin Korenblit wrote:

> +# Get target architecture
> +HOST_LLVM_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LLVM_TARGET_ARCH))

BR2_PACKAGE_LLVM_TARGET_ARCH does not exist, it is created by PATCH
2/3. This is not good, as it breaks bisectability.

Basically, your series should work even if we apply only PATCH 1/3. Or
if we apply only PATCH 1/3 and 2/3, etc.

So using in PATCH 1/3 something that is introduced in PATCH 2/3 is not
good.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
