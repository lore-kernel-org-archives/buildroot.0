From: Romain NAOUR <romain.naour@smile.fr>
Date: Wed, 18 Jan 2017 11:50:05 +0100
Subject: [Buildroot]
 =?utf-8?q?=5BPATCH=5D_package/libcap=3A_fix_build_wit?=
 =?utf-8?q?h_gperf_=3E=3D_3=2E1?=
In-Reply-To: <20170118213710.371edd2b@free-electrons.com>
References: <20170117221723.10235-1-romain.naour@gmail.com>
 <20170118213710.371edd2b@free-electrons.com>
Message-ID: <d53c542fbc81a0f7818e062cf93a30ae@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 2017-01-18 11:37, Thomas Petazzoni a ?crit :

> Hello,
> 
> On Tue, 17 Jan 2017 23:17:23 +0100, Romain Naour wrote:
> 
>> + libcap/Makefile | 4 ++-- + 1 file changed, 2 insertions(+), 2
>> deletions(-) + +diff --git a/libcap/Makefile b/libcap/Makefile +index
>> d189777..40cbc30 100644 +--- a/libcap/Makefile ++++ b/libcap/Makefile
>> +@@ -22,7 +22,7 @@ all: $(MINLIBNAME) $(STALIBNAME) libcap.pc + + 
>> ifeq
>> ($(BUILD_GPERF),yes) + USE_GPERF_OUTPUT = $(GPERF_OUTPUT)
>> +-INCLUDE_GPERF_OUTPUT = -include $(GPERF_OUTPUT)
>> ++INCLUDE_GPERF_OUTPUT = -include string.h -include $(GPERF_OUTPUT)
> 
> This change wasn't described in the patch description.

Indeed, sorry.
It's for size_t definition as recommended in a comment added recently 
in the gperf code.

Best regards,
Romain



> 
> Thomas
