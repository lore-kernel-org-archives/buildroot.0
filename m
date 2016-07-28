From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 28 Jul 2016 06:54:55 -0500
Subject: [Buildroot] [PATCH 1/1] Fix backward incompatibility on git
 downloader for git older than 1.8.4
In-Reply-To: <CANQCQpZrwMF63UaRJzCw6+zXqa5uEO-735UJDDEi4gkgWZRKMg@mail.gmail.com>
References: <1469695222-1749-1-git-send-email-eocanha@igalia.com>
 <CANQCQpZrwMF63UaRJzCw6+zXqa5uEO-735UJDDEi4gkgWZRKMg@mail.gmail.com>
Message-ID: <CANQCQpb+ZUXhwoKYhDvNk2e=RALSiE94M7AaEOkgf6rLs6+q+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enrique,

On Jul 28, 2016 3:40 AM, "Enrique Oca?a Gonz?lez" <eocanha@igalia.com>
wrote:
>
> The "--no-patch" option used by the git downloader appeared on git
> 1.8.4. Systems with older git versions show an error and fall back to
> the wget downloader, which isn't suitable for all the cases.
>
> Signed-off-by: Enrique Oca?a Gonz?lez <eocanha@igalia.com>
> ---
>  support/download/git | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/support/download/git b/support/download/git
> index 663006b..416cd1b 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -76,7 +76,7 @@ _git checkout -q "'${cset}'"
>
>  # Get date of commit to generate a reproducible archive.
>  # %cD is RFC2822, so it's fully qualified, with TZ and all.
> -date="$( _git show --no-patch --pretty=format:%cD )"
> +date="$( _git log -1 --pretty=format:%cD )"

Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>

>
>  # There might be submodules, so fetch them.
>  if [ ${recurse} -eq 1 ]; then
> --
> 1.8.3.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160728/d71fa898/attachment.html>
