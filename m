From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 23:16:27 +0200
Subject: [Buildroot] [PATCH v2 1/1] tzdata: Reorder zone list to avoid
 missing links
In-Reply-To: <1460103807-8770-1-git-send-email-mma@objectxp.com>
References: <1459939293-4711-1-git-send-email-mma@objectxp.com>
 <1460103807-8770-1-git-send-email-mma@objectxp.com>
Message-ID: <20160419231627.026d3ccc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  8 Apr 2016 10:23:27 +0200, Michel Marti wrote:
> The 'backward' zone references entries from other zones (e.g. Pacific/*)
> that have not yet been compiled, leading to missing links. To fix this,
> take-over the zone list sort order from upstream 'tzdata' and also ensure
> that make fails if zic terminates with a non-zero exit code.
> 
> Signed-off-by: Michel Marti <mma@objectxp.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/tzdata/tzdata.mk | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
