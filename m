From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Jan 2017 21:37:10 +1100
Subject: [Buildroot] [PATCH] package/libcap: fix build with gperf >= 3.1
In-Reply-To: <20170117221723.10235-1-romain.naour@gmail.com>
References: <20170117221723.10235-1-romain.naour@gmail.com>
Message-ID: <20170118213710.371edd2b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Jan 2017 23:17:23 +0100, Romain Naour wrote:
> + libcap/Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/libcap/Makefile b/libcap/Makefile
> +index d189777..40cbc30 100644
> +--- a/libcap/Makefile
> ++++ b/libcap/Makefile
> +@@ -22,7 +22,7 @@ all: $(MINLIBNAME) $(STALIBNAME) libcap.pc
> + 
> + ifeq ($(BUILD_GPERF),yes)
> + USE_GPERF_OUTPUT = $(GPERF_OUTPUT)
> +-INCLUDE_GPERF_OUTPUT = -include $(GPERF_OUTPUT)
> ++INCLUDE_GPERF_OUTPUT = -include string.h -include $(GPERF_OUTPUT)

This change wasn't described in the patch description.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
