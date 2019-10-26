From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 19:04:55 +0200
Subject: [Buildroot] [PATCH v2] package/systemd: create /etc/resolv.conf
 only if resolvd is selected
In-Reply-To: <20191026161702.8159-1-unixmania@gmail.com>
References: <20191026161702.8159-1-unixmania@gmail.com>
Message-ID: <20191026190455.04595b73@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Oct 2019 13:17:02 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Or else it becomes a dangling link to /run/systemd/resolve/resolv.conf,
> which is never created. Even worst, it also prevents NewtorkManager from
> updating resolv.conf.
> 
> Fixes:
>   https://bugs.busybox.net/show_bug.cgi?id=9881
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
> CC: Michael Nosthoff <posted@heine.so>
> ---
> Changes v1->v2:
>   - Rebase after bump to version 243
> ---
>  package/systemd/systemd.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
