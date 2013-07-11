From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 11 Jul 2013 11:37:10 +0200
Subject: [Buildroot] [PATCH] Makefile: unset MAKEFLAGS
In-Reply-To: <1373222539-8915-1-git-send-email-s.martin49@gmail.com>
References: <1373222539-8915-1-git-send-email-s.martin49@gmail.com>
Message-ID: <CAAXf6LVC=vqL0mCFVMpKs2A99QtBviHXsmXZp3B+fo+32-+dXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, Jul 7, 2013 at 8:42 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> MAKEFLAGS can carry options that make Buildroot failed, eg. '-jN'.
> To avoid this, unset the MAKEFLAGS environment variable.
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Makefile b/Makefile
> index 015fbdf..11a7b70 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -207,6 +207,7 @@ unexport CFLAGS
>  unexport CXXFLAGS
>  unexport GREP_OPTIONS
>  unexport CONFIG_SITE
> +unexport MAKEFLAGS
>  unexport QMAKESPEC
>  unexport TERMINFO
>

What is the strategy with respect to cleaning up the user's
environment when building buildroot?
Because there are a number of other variables that users can have (and
do have) that corrupt the build, for example:

C_INCLUDE_PATH
CPLUS_INCLUDE_PATH
LIBRARY_PATH
LD_LIBRARY_PATH
PERL5LIB
GCC_EXEC_PREFIX

In the twisted environments that I'm working in, I'm unsetting these
from a wrapper around buildroot make. However, it seems that there
already are a number of cleanups done inside buildroot itself, so it
makes sense to add the above variables to the list.

What do you think?

Best regards,
Thomas
