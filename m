From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jul 2017 17:59:28 +0200
Subject: [Buildroot] [PATCH 1/7] Makefile: properly create
 $(HOST_DIR)/usr compatibility symlink
In-Reply-To: <20170709232123.30120-2-arnout@mind.be>
References: <20170709232123.30120-1-arnout@mind.be>
 <20170709232123.30120-2-arnout@mind.be>
Message-ID: <20170710175928.3138db23@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Jul 2017 01:21:17 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Up to now we created the $(HOST_DIR)/usr compatibility symlink as part
> of the creation of $(HOST_DIR) itself. However, when the user specifies
> a custom BR2_HOST_DIR, it is possible that the directory already exists
> so this rule will never trigger.
> 
> Therefore, add an explicit rule for creating $(HOST_DIR)/usr and add
> this rule to the dependencies of the dirs target. HOST_DIR itself goes
> back to the standard rule for directories. The order-only dependency of
> STAGING_DIR isn't needed any more either: HOST_DIR is implicitly
> created if needed by mkdir -p, and we don't need to trigger the
> HOST_DIR rule any more if the directory already exists.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  Makefile | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
