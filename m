From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 13 Feb 2014 14:46:00 +0100
Subject: [Buildroot] [PATCH 2/6] docs/manual: indicate how to handle
	BR2_TOOLCHAIN_HAS_THREADS_NPTL
In-Reply-To: <1392297727-17627-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392297727-17627-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392297727-17627-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LWGG+8+EW9vVNMpVuYftFsOD23MmEy7ZJpBUv_3y2GMdQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 13, 2014 at 2:22 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  docs/manual/adding-packages-directory.txt | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index 754a145..e1299c3 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -235,7 +235,13 @@ use in the comment.
>
>  * thread support
>  ** Dependency symbol: +BR2_TOOLCHAIN_HAS_THREADS+
> -** Comment string: +threads+
> +** Comment string: +threads+ (unless +BR2_TOOLCHAIN_HAS_THREADS_NPTL+
> +   is also needed, in which case, specifying only +NPTL threads+ is
> +   sufficient)
> +
> +* NPTL thread support
> +** Dependency symbol: +BR2_TOOLCHAIN_HAS_THREADS_NPTL+
> +** Comment string: +NPTL threads+
>
>  * RPC support
>  ** Dependency symbol: +BR2_TOOLCHAIN_HAS_NATIVE_RPC+

Should we maybe use 'NPTL' rather than 'NPTL threads' to make the
string shorter? (we want to fit in 80chars).
It's true that it's a bit more cryptic, but so is RPC, wchar, etc.
The biggest point is that a user can go to the Toolchain menu and
recognize a string that matches, in this case the keyword NPTL.

Best regards,
Thomas
