From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 5 Mar 2014 11:54:41 +0100
Subject: [Buildroot] [PATCH] crda: Disable for Python 3
In-Reply-To: <1394015910-64878-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1394015910-64878-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <CAHXCMMKboUGOeitP0rfouvAGyuyKkSFWX7qGxkDJqZ=Q+0-hMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent, all,

On Wed, Mar 5, 2014 at 11:38 AM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
> This package is not compatible with Python 3.
>
> Fixes:
>    http://autobuild.buildroot.net/results/a1e/a1e53d66d3962fd5431e7601937b071a0a3c2084/
>
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/crda/Config.in |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/package/crda/Config.in b/package/crda/Config.in
> index e56a45e..c59f6ec 100644
> --- a/package/crda/Config.in
> +++ b/package/crda/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_CRDA
>         bool "crda"
>         depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
> +       depends on !BR2_PACKAGE_PYTHON3

That's the short term fix to make the autobuilders happy! ;-)

I've prepared a series fixing this [1], but still need some time for
testing before posting it.

Regards,


[1] https://github.com/tSed/buildroot/commits/sma/host-python2


-- 
Samuel
