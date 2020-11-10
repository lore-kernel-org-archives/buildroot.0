From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 10 Nov 2020 23:29:52 +0100
Subject: [Buildroot] [PATCH] support/testing: update to the new text
 representation of capabilities
In-Reply-To: <20201110222901.1289515-1-romain.naour@gmail.com>
References: <20201110222901.1289515-1-romain.naour@gmail.com>
Message-ID: <785bda8a-0c8c-e37b-6247-15e756ae83b3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 10/11/2020 ? 23:29, Romain Naour a ?crit?:
> Since libcap 2.41, the text representation of capabilities now use
> the '=' instead of '+' [1].
> 
> This break our capabilities tests since we still use the old
> representation.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=177cd418031b1acfcf73fe3b1af9f3279828681c

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981737

> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  support/testing/tests/core/test_file_capabilities.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/core/test_file_capabilities.py b/support/testing/tests/core/test_file_capabilities.py
> index 945b48a4c3..b9ece18d7b 100644
> --- a/support/testing/tests/core/test_file_capabilities.py
> +++ b/support/testing/tests/core/test_file_capabilities.py
> @@ -44,4 +44,4 @@ class TestFileCapabilities(infra.basetest.BRTest):
>          self.assertIn("cap_kill", output[0])
>          self.assertIn("cap_sys_nice", output[0])
>          self.assertIn("cap_sys_time", output[0])
> -        self.assertIn("+eip", output[0])
> +        self.assertIn("=eip", output[0])
> 
