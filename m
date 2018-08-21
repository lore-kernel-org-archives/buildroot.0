From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Tue, 21 Aug 2018 09:10:50 +0200
Subject: [Buildroot] 
 =?iso-8859-1?q?=5BRFC_2/3=5D_hardening_testing=3A_bu?=
 =?iso-8859-1?q?sybox_test_case_to_verify_linker_wrapper_behavior_with_-r?=
In-Reply-To: <1534220803-26737-3-git-send-email-matthew.weber@rockwellcollins.com>
References: <1534220803-26737-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1534220803-26737-3-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <ae55c90d-1837-4760-b01e-380778344ea2@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On ?ter? 14. srpna 2018 6:26:42 CEST, Matt Weber wrote:
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  support/testing/tests/core/test_hardening.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/support/testing/tests/core/test_hardening.py 
> b/support/testing/tests/core/test_hardening.py
> index fcec46f..ab8d078 100644
> --- a/support/testing/tests/core/test_hardening.py
> +++ b/support/testing/tests/core/test_hardening.py
> @@ -21,7 +21,7 @@ class TestHardeningBase(infra.basetest.BRTest):
>          BR2_PACKAGE_HOST_CHECKSEC=y
>          # BR2_TARGET_ROOTFS_TAR is not set
>          """
> -    checksec_files = ["usr/sbin/lighttpd"]
> +    checksec_files = ["usr/sbin/lighttpd", "target/bin/busybox"]
>  
>      def checksec_run(self, target_file):
>          filepath = os.path.join(self.builddir, "target", target_file)

This patch does not apply to neither master nor next for me because there's 
no support/testing/tests/core/test_hardening.py in there.
