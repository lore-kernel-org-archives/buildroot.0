From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 4 Sep 2015 13:31:59 +0100
Subject: [Buildroot] [PATCH 2/3] package/ltp-testsuite: enable
 power-management tests
In-Reply-To: <1441270918-28981-3-git-send-email-anders.roxell@linaro.org>
References: <1441270918-28981-1-git-send-email-anders.roxell@linaro.org>
 <1441270918-28981-3-git-send-email-anders.roxell@linaro.org>
Message-ID: <55E98F3F.5040501@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anders Roxell,
On 09/03/2015 10:01 AM, Anders Roxell wrote:
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  package/ltp-testsuite/ltp-testsuite.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
> index 48733f2..634fc45 100644
> --- a/package/ltp-testsuite/ltp-testsuite.mk
> +++ b/package/ltp-testsuite/ltp-testsuite.mk
> @@ -10,6 +10,7 @@ LTP_TESTSUITE_SITE = http://downloads.sourceforge.net/project/ltp/LTP%20Source/l
>  LTP_TESTSUITE_LICENSE = GPLv2 GPLv2+
>  LTP_TESTSUITE_LICENSE_FILES = COPYING
>  LTP_TESTSUITE_CONF_OPTS += \
> +			   --with-power-management-testsuite \
>  			   --with-realtime-testsuite
>  
>  # Needs libcap with file attrs which needs attr, so both required
> 

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Compile test for MIPS architecture:

$ sha256sum
output/build/ltp-testsuite-20140115/testcases/kernel/power_management/runpwtests.sh
a6700d41611b926a495827de43ef96edd1b86cb65fd1e8a972d021c910edca2f
output/build/ltp-testsuite-20140115/testcases/kernel/power_management/runpwtests.sh

$ sha256sum output/target/usr/testcases/bin/runpwtests.sh
a6700d41611b926a495827de43ef96edd1b86cb65fd1e8a972d021c910edca2f
output/target/usr/testcases/bin/runpwtests.sh

Regards,

Vincent.
