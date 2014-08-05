From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Aug 2014 22:21:27 +0200
Subject: [Buildroot] [PATCH 1/1] support/download: fix the git helper
In-Reply-To: <1407269590-4384-1-git-send-email-ps.report@gmx.net>
References: <1407269590-4384-1-git-send-email-ps.report@gmx.net>
Message-ID: <20140805202127.GD4268@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-08-05 22:13 +0200, Peter Seiderer spake thusly:
> Re-add the git_done variable (lost in commit [1]).
> 
> Fixes download problem reported by Rohit Kumar [2].
> 
> [1] http://git.buildroot.net/buildroot/commit/?id=7e40a1103a919a8177f00ddca2b46b4439953511
> [2] http://lists.busybox.net/pipermail/buildroot/2014-August/103733.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Gah.. Yes, of course! Thanks!

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  support/download/git | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/support/download/git b/support/download/git
> index 6edaa90..d451530 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -19,6 +19,7 @@ basename="${4}"
>  
>  # Try to see if we can do a shallow clone, since it is faster
>  # than a full clone.
> +git_done=0
>  if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
>      printf "Doing shallow clone\n"
>      if ${GIT} clone --depth 1 -b "${cset}" --bare "${repo}" "${basename}"; then
> -- 
> 1.8.1.4
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
