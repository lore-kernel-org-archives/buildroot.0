From: Andrey Yurovsky <yurovsky@gmail.com>
Date: Tue, 1 Aug 2017 15:11:26 -0700
Subject: [Buildroot] [git commit] CHANGES: update after binutils changes
In-Reply-To: <20170801213610.2254F802AA@busybox.osuosl.org>
References: <20170801213610.2254F802AA@busybox.osuosl.org>
Message-ID: <CAAkeqgVCXiR0g0HRUuGyPRivJFschFc4FGxan2B=EpYrucGsQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 1, 2017 at 2:40 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=ca74790030e4eec04e25a633e23400c2d89fc89c
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  CHANGES | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/CHANGES b/CHANGES
> index f647953..e31fd7a 100644
> --- a/CHANGES
> +++ b/CHANGES
> @@ -66,6 +66,8 @@
>
>         - Switch to gcc 6.x as the default gcc version, add support
>           for gcc 7.x, remove support for gcc 4.8

however with GCC 7.X graphite is broken. Since we're removing GCC 4.8
the fix that Arnout suggested can be implemented in this release and
then we won't ship a broken configuration.
https://bugs.buildroot.org/show_bug.cgi?id=10091
(basically remove cloog, bump ISL) ... if I sent a patch implementing
this, would it still be in time?
