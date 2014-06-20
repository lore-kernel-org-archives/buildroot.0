From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Jun 2014 22:33:59 +0200
Subject: [Buildroot] [PATCH] support: graph-depends requires Python 2
In-Reply-To: <1403206215-5562-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1403206215-5562-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <53A49AB7.2080508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/06/14 21:30, Vivien Didelot wrote:
> Python 3 becomes the default version on some distributions (such as
> Archlinux), while they all (Debian, Ubuntu, Arch, Fedora, etc.) define a
> python2 symlink for consistency.

 Is that also true for old RHEL? Those beasts offer 10 years of support so you
get really really old ones out there...

 It would be better to just make the script python3-compliant. Probably just a
matter of adding brackets around the print statements -- patch follows.

 Regards,
 Arnout

> 
> Let's specify it in the graph-depends script to make it clear that it
> requires the version 2 of Python to work.
> 
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> ---
>  support/scripts/graph-depends | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
> index e2a5e1e..e323e3f 100755
> --- a/support/scripts/graph-depends
> +++ b/support/scripts/graph-depends
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python
> +#!/usr/bin/python2
>  
>  # Usage (the graphviz package must be installed in your distribution)
>  #  ./support/scripts/graph-depends [-p package-name] > test.dot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
