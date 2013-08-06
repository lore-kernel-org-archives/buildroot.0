From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 6 Aug 2013 13:44:26 +0200
Subject: [Buildroot] [git commit] eglibc: add comment explaining why we
 pass -O2
In-Reply-To: <20130806104644.616309B190@busybox.osuosl.org>
References: <20130806104644.616309B190@busybox.osuosl.org>
Message-ID: <CAAXf6LW9XDGwTvqhCimQ8fM7WktsFWPdMyiqgdKPuEQLyMQ6+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Aug 6, 2013 at 12:46 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=f443c8317bfadfdfdfe38a1731dcfbdba3a6d0ae
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> While reviewing the eglibc package, Peter mentionned that it would be
> good to add a comment that explains why we explicitly build eglibc
> with -O2 instead of using the user selected optimization level. This
> commit add such a comment.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/eglibc/eglibc.mk |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/package/eglibc/eglibc.mk b/package/eglibc/eglibc.mk
> index 253dabd..8873a06 100644
> --- a/package/eglibc/eglibc.mk
> +++ b/package/eglibc/eglibc.mk
> @@ -36,6 +36,9 @@ endif
>  #
>  #  2. We have to execute the configure script with bash and not sh.
>  #
> +# Note that as mentionned in

s/mentionned/mentioned/

> +# http://patches.openembedded.org/patch/38849/, eglibc must be built
> +# with -O2, so we pass our own CFLAGS and CXXFLAGS below.
>  define EGLIBC_CONFIGURE_CMDS
>         mkdir -p $(@D)/build
>         # Do the configuration


Best regards,
Thomas
