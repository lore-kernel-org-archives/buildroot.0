From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Mar 2014 07:34:53 +0100
Subject: [Buildroot] [PATCH 04/13] pkg-infra: move the git download
	helper to a script
In-Reply-To: <1e961a98c83a9d2420c7c6a4177aa7cafb175291.1393781650.git.yann.morin.1998@free.fr>
References: <cover.1393781649.git.yann.morin.1998@free.fr>
 <1e961a98c83a9d2420c7c6a4177aa7cafb175291.1393781650.git.yann.morin.1998@free.fr>
Message-ID: <5316C58D.9040105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/03/14 18:51, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> The git download helper is getting a bit more complex. Fixing it in the
> Makefile when it breaks (like the recent breakage with a non-existing
> sha1-cset) proves to be challenging, to say the least.
> 
> Move it into a shell script in support/download/git, which will make
> it much easier to read, maintain, fix and enhance in the future.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/pkg-download.mk | 17 +++--------------
>  support/download/git    | 37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+), 14 deletions(-)
>  create mode 100755 support/download/git
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
