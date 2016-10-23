From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Oct 2016 14:54:20 +0200
Subject: [Buildroot] [PATCH] pkg-download: fix fetching URLs with ? from
 PRIMARY/SECONDARY
In-Reply-To: <20161021202715.16528-1-arnout@mind.be>
References: <20161021202715.16528-1-arnout@mind.be>
Message-ID: <20161023145420.6172618b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Oct 2016 22:27:15 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Some packages download files (especially patches) with a ? in the
> URL. The ? marks the query part of the URL. However, the downloaded
> file still contains the ? but from then on it doesn't designate a
> query part anymore. Therefore, when fetching from PRIMARY or
> SECONDARY site over http, the server will report a 404 Not Found.
> 
> To fix, we need to replace the ? with %3F. Obviously, this should
> be done only when fetching from PRIMARY or SECONDARY. For fetching
> from the real upstream, the ? really does designate the query part.
> 
> Fixes #9371.
> 
> Reported-by: Johan Derycke <johanderycke@gmail.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> I tested with
> make BR2_PRIMARY_SITE=http://localhost/dl BR2_PRIMARY_SITE_ONLY=y BR2_DL_DIR=/tmp/dl openssl
> and also checked with a file:// primary site, with secondary site, and
> openssl-source-check
> ---
>  package/pkg-download.mk | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Applied to master, after s/SECONDARY/BACKUP/.

Peter can you take the appropriate actions in sources.b.o ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
