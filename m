From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 Jul 2016 23:47:55 +0200
Subject: [Buildroot] [PATCH] support/download: support git older then
 1.8.x
In-Reply-To: <1469653038-64643-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1469653038-64643-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20160727214755.GB5657@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, All,

Nit-pick: since you applied Enrique's patch, you should probably have
used him as author.

On 2016-07-27 15:57 -0500, Matt Weber spake thusly:
> A recent commit[1] in the git downloader uses the "--no-patch" option,
> which appeared on git 1.8.4. Systems with older git versions show an
> error and fall back to the wget downloader, which isn't suitable for
> all the cases.
> 
> This commit uses a "git log" variant and works on older systems.
> 
> [1]
> https://github.com/buildroot/buildroot/commit/3abd5ba4243489b821d44e407528020cd8a138f8#diff-75410bcfefacf16bcd60a2a6ac77c433R73
> 
> Signed-off-by: Enrique Ocana Gonzalez <eocanha@igalia.com>

Beside, you can't go adding a SoB-line for someone else. A SoB-line is
kinda legaly-binding:

    http://developercertificate.org/

Enrique, if you agree that your SoB-line is warranted, we can go the
fast route: just reply to the original mail with your own SoB-line, and
all will be good in the best of the worlds! ;-)

> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
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

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  # There might be submodules, so fetch them.
>  if [ ${recurse} -eq 1 ]; then
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
