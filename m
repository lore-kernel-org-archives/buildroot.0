From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Sep 2015 15:09:16 +0200
Subject: [Buildroot] [PATCH] shairport-sync: fix non-existent meta_dir
 member of shairport_cfg struct
In-Reply-To: <1442838575-11855-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1442838575-11855-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150923150916.456c2296@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente,

On Mon, 21 Sep 2015 13:29:35 +0100, Vicente Olivert Riera wrote:
> shairport-sync tries to access to a non-existent member called
> "meta_dir" of a "shairport_cfg" struct:
> 
> [snip]
> if (config.meta_dir)
> [snip]
> 
> That struct doesn't have that member so it causes a build failure like
> this one:
> 
> mdns_tinysvcmdns.c: In function 'mdns_tinysvcmdns_register':
> mdns_tinysvcmdns.c:121:13: error: 'shairport_cfg' has no member named
> 'meta_dir'
> if (config.meta_dir)
> 
> This issue has been reported and fixed upstream:
> 
>   https://github.com/mikebrady/shairport-sync/issues/128#issuecomment-141947175
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/89d/89d22ba2d41e05b407cde04c7e57510b36973ce9/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/shairport-sync/shairport-sync.mk |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
