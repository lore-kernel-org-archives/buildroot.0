From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 13 Mar 2018 08:39:53 +0100
Subject: [Buildroot] [PATCH v3 3/7] test_python_cryptography: fix code
 style
In-Reply-To: <1520910585-19097-4-git-send-email-ricardo.martincoski@gmail.com>
References: <1520910585-19097-1-git-send-email-ricardo.martincoski@gmail.com>
 <1520910585-19097-4-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <CAGm1_ktLep5DC3DODq3rw1va4Ebe6n5Xu=WAdp7s=P0=4pwcbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 13, 2018 at 4:09 AM, Ricardo Martincoski
<ricardo.martincoski@gmail.com> wrote:
> Fix these warnings:
> E122 continuation line missing indentation or outdented
> E301 expected 1 blank line, found 0
> E302 expected 2 blank lines, found 1
> F401 'os' imported but unused
>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
> Changes v2 -> v3:
>   - no changes
>
> Changes v1 -> v2:
>   - new patch (v1 of this series was not sent yet during the review of
>     http://patchwork.ozlabs.org/patch/811011/ so I asked to fix all in
>     the same series.
>
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/57046960
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/57046961
> ---
>  .../tests/package/test_python_cryptography.py      | 23 ++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/support/testing/tests/package/test_python_cryptography.py b/support/testing/tests/package/test_python_cryptography.py
> index b60152d..78c3ef5 100644
> --- a/support/testing/tests/package/test_python_cryptography.py
> +++ b/support/testing/tests/package/test_python_cryptography.py
> @@ -1,7 +1,6 @@
> -import os
> -
>  from tests.package.test_python import TestPythonBase
>
> +
>  class TestPythonCryptography(TestPythonBase):
>      def fernet_test(self, timeout=-1):
>          cmd = self.interpreter + " -c 'from cryptography.fernet import Fernet;"
> @@ -10,22 +9,26 @@ class TestPythonCryptography(TestPythonBase):
>          _, exit_code = self.emulator.run(cmd, timeout)
>          self.assertEqual(exit_code, 0)
>
> +
>  class TestPythonPy2Cryptography(TestPythonCryptography):
>      config = TestPythonBase.config + \
> -"""
> -BR2_PACKAGE_PYTHON=y
> -BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
> -"""
> +        """
> +        BR2_PACKAGE_PYTHON=y
> +        BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
> +        """
> +
>      def test_run(self):
>          self.login()
>          self.fernet_test(40)
>
> +
>  class TestPythonPy3Cryptography(TestPythonCryptography):
>      config = TestPythonBase.config + \
> -"""
> -BR2_PACKAGE_PYTHON3=y
> -BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
> -"""
> +        """
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
> +        """
> +
>      def test_run(self):
>          self.login()
>          self.fernet_test(40)
> --
> 2.7.4
>
