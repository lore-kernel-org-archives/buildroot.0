From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 22 Jan 2018 09:50:22 +0100
Subject: [Buildroot] [PATCH 04/14] pycompile: fix code style
In-Reply-To: <1516581882-30582-5-git-send-email-ricardo.martincoski@gmail.com>
References: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
 <1516581882-30582-5-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <CAGm1_kvC-vEZCW5A=XMirUzO265mMA6uu5UbRKHrTaX8bc9W5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 22, 2018 at 1:44 AM, Ricardo Martincoski
<ricardo.martincoski@gmail.com> wrote:
> Fix these warnings:
> E302 expected 2 blank lines, found 1
> E305 expected 2 blank lines after class or function definition, found 1
>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  support/scripts/pycompile.py | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
> index 8e164ab..9192a70 100644
> --- a/support/scripts/pycompile.py
> +++ b/support/scripts/pycompile.py
> @@ -12,6 +12,7 @@ import py_compile
>  import compileall
>  import argparse
>
> +
>  def check_for_errors(comparison):
>      '''Wrap comparison operator with code checking for PyCompileError.
>      If PyCompileError was raised, re-raise it again to abort execution,
> @@ -28,6 +29,7 @@ def check_for_errors(comparison):
>
>      return operator
>
> +
>  class ReportProblem(int):
>      '''Class that pretends to be an int() object but implements all of its
>      comparison operators such that it'd detect being called in
> @@ -55,6 +57,7 @@ class ReportProblem(int):
>      def __ne__(self, other):
>          return not self == other
>
> +
>  parser = argparse.ArgumentParser(description='Compile Python source files in a directory tree.')
>  parser.add_argument("target", metavar='DIRECTORY',
>                      help='Directory to scan')
> --
> 2.7.4
>
