From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 19:44:47 +0200
Subject: [Buildroot] [PATCH v2] .gitlab-ci.yml: simplify (and fix)
 check-DEVELOPERS
In-Reply-To: <20170701172817.6533-1-arnout@mind.be>
References: <20170701172817.6533-1-arnout@mind.be>
Message-ID: <20170701194447.0f7c1859@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 1 Jul 2017 19:28:17 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The check-DEVELOPERS test would always fail, because && will return
> the exit code of the left-hand side if not 0, so it *always* returns
> 1.
> 
> But in fact, the test can be simplified quite a lot: we can run
> getdeveloper directly, without arguments. That should just print
> 'No action specified', but it will also print any syntax errors it
> encountered. So we can just 'grep -v' the expected output away; if
> there is anything more, grep will return 0, but if there is nothing
> more, it will return 1. So we just need to invert the result.
> 
> Incidentally, this also fixes the incorrect remaining reference to
> support/scripts.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  .gitlab-ci.yml    | 4 +---
>  .gitlab-ci.yml.in | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
