From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Jun 2014 22:42:30 +0200
Subject: [Buildroot] [PATCH 2/2] graph-depends: remove unnecessary
 redirect of stderr
In-Reply-To: <1403554284-4935-2-git-send-email-arnout@mind.be>
References: <1403554284-4935-1-git-send-email-arnout@mind.be>
 <1403554284-4935-2-git-send-email-arnout@mind.be>
Message-ID: <20140623204230.GA3572@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-06-23 22:11 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> It hides any error messages reported by make.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Not sure what the test-case for that one would be, but it looks sane.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  support/scripts/graph-depends | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
> index 52c16ce..1ecfeda 100755
> --- a/support/scripts/graph-depends
> +++ b/support/scripts/graph-depends
> @@ -82,7 +82,7 @@ allpkgs = []
>  def get_targets():
>      sys.stderr.write("Getting targets\n")
>      cmd = ["make", "-s", "--no-print-directory", "show-targets"]
> -    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
> +    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
>      output = p.communicate()[0].strip()
>      if p.returncode != 0:
>          return None
> @@ -98,7 +98,7 @@ def get_depends(pkgs):
>      cmd = ["make", "-s", "--no-print-directory" ]
>      for pkg in pkgs:
>          cmd.append("%s-show-depends" % pkg)
> -    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
> +    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
>      output = p.communicate()[0]
>      if p.returncode != 0:
>          sys.stderr.write("Error getting dependencies %s\n" % pkgs)
> -- 
> 2.0.0
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
