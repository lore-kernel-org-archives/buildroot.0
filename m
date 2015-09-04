From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 4 Sep 2015 13:31:49 +0100
Subject: [Buildroot] [PATCH 1/3] package/ltp-testsuite: enable realtime
 tests
In-Reply-To: <1441270918-28981-2-git-send-email-anders.roxell@linaro.org>
References: <1441270918-28981-1-git-send-email-anders.roxell@linaro.org>
 <1441270918-28981-2-git-send-email-anders.roxell@linaro.org>
Message-ID: <55E98F35.8000703@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anders Roxell,

On 09/03/2015 10:01 AM, Anders Roxell wrote:
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  package/ltp-testsuite/ltp-testsuite.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
> index acc1640..48733f2 100644
> --- a/package/ltp-testsuite/ltp-testsuite.mk
> +++ b/package/ltp-testsuite/ltp-testsuite.mk
> @@ -9,6 +9,8 @@ LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
>  LTP_TESTSUITE_SITE = http://downloads.sourceforge.net/project/ltp/LTP%20Source/ltp-$(LTP_TESTSUITE_VERSION)
>  LTP_TESTSUITE_LICENSE = GPLv2 GPLv2+
>  LTP_TESTSUITE_LICENSE_FILES = COPYING
> +LTP_TESTSUITE_CONF_OPTS += \
> +			   --with-realtime-testsuite
>  
>  # Needs libcap with file attrs which needs attr, so both required
>  ifeq ($(BR2_PACKAGE_LIBCAP)$(BR2_PACKAGE_ATTR),yy)
> 

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Compile test for MIPS architecture:

$ file output/target/usr/testcases/realtime/stress/pi-tests/testpi-3
output/target/usr/testcases/realtime/stress/pi-tests/testpi-3: ELF
32-bit MSB executable, MIPS, MIPS32 rel2 version 1 (SYSV), dynamically
linked (uses shared libs), for GNU/Linux 2.6.32, with unknown capability
0x41000000 = 0xf676e75, with unknown capability 0x10000 = 0x70401, stripped

Regards,

Vincent.
