From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 May 2021 22:16:54 +0200
Subject: [Buildroot] [PATCH] support/testing: test_hardening disable
 PIC/PIE
In-Reply-To: <20210513162245.3213498-1-romain.naour@gmail.com>
References: <20210513162245.3213498-1-romain.naour@gmail.com>
Message-ID: <f2bbd410-40b7-9fa9-6a24-8241da811fee@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/05/2021 18:22, Romain Naour wrote:
> Since [1], PIC/PIE is enabled by default but the TestRelroPartial
> test expect implicitely PIC/PIE being disabled.
> 
> Disable PIC/PIE from the config fragment provided by
> TestRelroPartial.
> 
> [1] 810ba387bec3c5b6904e8893fb4cb6f9d3717466
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1255661757
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  support/testing/tests/core/test_hardening.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/support/testing/tests/core/test_hardening.py b/support/testing/tests/core/test_hardening.py
> index 60e14303a3..e9d30f3a38 100644
> --- a/support/testing/tests/core/test_hardening.py
> +++ b/support/testing/tests/core/test_hardening.py
> @@ -52,6 +52,7 @@ class TestRelroPartial(TestHardeningBase):
>      config = TestHardeningBase.config + \
>          """
>          BR2_RELRO_PARTIAL=y
> +        # BR2_PIC_PIE is not set
>          """
>  
>      def test_run(self):
> 
