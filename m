From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Sep 2014 09:25:21 +0200
Subject: [Buildroot] [PATCH v3] gcc: explicitly use
 C{XX}FLAGS_FOR_TARGET instead of --enable-target-optspace
In-Reply-To: <1409553165-10253-1-git-send-email-abrodkin@synopsys.com>
References: <1409553165-10253-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20140901092521.163d726f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon,  1 Sep 2014 10:32:45 +0400, Alexey Brodkin wrote:

>  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810
>  # Workaround until it's fixed in 4.5.4 or later
>  ifeq ($(ARCH),powerpc)
>  ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
> -HOST_GCC_COMMON_CONF_OPT += --disable-target-optspace
> +GCC_COMMON_TARGET_CFLAGS := $(filter-out -Os,$(GCC_COMMON_TARGET_CFLAGS))
> +GCC_COMMON_TARGET_CXXFLAGS := $(filter-out -Os,$(GCC_COMMON_TARGET_CXXFLAGS))

Is there any reason to use := instead of = here? We normally use =
except when it's really necessary to use :=.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
