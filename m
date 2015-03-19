From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Mar 2015 21:34:32 +0100
Subject: [Buildroot] [PATCH 1/5 v2] support/download: make hash file
 optional
In-Reply-To: <26bebad3dca4191b35ddb2dae535b15de9a883c2.1426597114.git.yann.morin.1998@free.fr>
References: <cover.1426597114.git.yann.morin.1998@free.fr>
 <26bebad3dca4191b35ddb2dae535b15de9a883c2.1426597114.git.yann.morin.1998@free.fr>
Message-ID: <550B32D8.9050302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/03/15 13:59, Yann E. MORIN wrote:
> Currently, specifying a hash file for our download wrapper is mandatory.
> 
> However, when we download a git, svn, bzr, hg or cvs tree, there's by
> design no hash to check the download against.
> 
> Since we're going to have hash checking mandatory when a hash file
> exists, this would break those downloads from a repository.
> 
> So, make specifying a hash file optional when calling our download
> wrapper and bail out early from the check-hash script if no hash file is
> specified.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 I would actually have squashed the following patch into this one, since for
reviewing you anyway have to look at the two together.


 Regards,
 Arnout

> ---
>  support/download/check-hash | 2 +-
>  support/download/dl-wrapper | 3 ---
>  2 files changed, 1 insertion(+), 4 deletions(-)
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
