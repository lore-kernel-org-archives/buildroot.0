From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jun 2014 12:54:50 +0200
Subject: [Buildroot] [PATCH v4 01/11] pkg-cmake.mk: refactor the
 toolchainfile.cmake generation
In-Reply-To: <1401614673-3703-2-git-send-email-s.martin49@gmail.com>
References: <1401614673-3703-1-git-send-email-s.martin49@gmail.com>
 <1401614673-3703-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20140601125450.75594d10@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  1 Jun 2014 11:24:23 +0200, Samuel Martin wrote:
> This patch introduces a toolchainfile.cmake.in template which is filled
> by Buildroot.
> 
> Using a toolchainfile.cmake.in template file allows to avoid overloading
> quoting and/or escaping and it becomes much more similar to the
> resulting file.
> 
> This patch also cleans up the quoting style.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Baruch Siach <baruch@tkos.co.il>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> +	sed \
> +		-e 's:@@HOST_DIR@@:$(call qstrip,$(HOST_DIR)):' \
> +		-e 's:@@STAGING_DIR@@:$(call qstrip,$(STAGING_DIR)):' \
> +		-e 's:@@TARGET_CFLAGS@@:$(call qstrip,$(TARGET_CFLAGS)):' \
> +		-e 's:@@TARGET_CXXFLAGS@@:$(call qstrip,$(TARGET_CXXFLAGS)):' \
> +		-e 's:@@TARGET_CC_NOCCACHE@@:$(call qstrip,$(TARGET_CC_NOCCACHE)):' \
> +		-e 's:@@TARGET_CXX_NOCCACHE@@:$(call qstrip,$(TARGET_CXX_NOCCACHE)):' \
> +		< $(TOPDIR)/support/misc/toolchainfile.cmake.in \

The stdin redirection here is not strictly needed: as argument, sed
takes an input file. But it's not necessary to do another post of the
patch series just for this, I believe.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
