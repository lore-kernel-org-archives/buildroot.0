From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 12:52:01 +0100
Subject: [Buildroot] [PATCH 1/1] busybox: write commented login line in
 /etc/inittab when getty disabled
In-Reply-To: <20191001130948.17935-1-mailist@logilin.fr>
References: <20191001130948.17935-1-mailist@logilin.fr>
Message-ID: <20191027125201.372c4548@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  1 Oct 2019 15:09:48 +0200
Stephen Bos <mailist@logilin.fr> wrote:

> From: Stephen Bos <stephen.bos@hagergroup.com>
> 
> When the "Run a getty" option is disabled, busybox doesn't remove the
> /etc/inittab line from previous builds. With this patch, the line is
> correctly commented out.
> 
> Signed-off-by: Stephen Bos <stephen.bos@hagergroup.com>
> Co-authored-by: Stephen Bos <stephen.bos@hagergroup.com>
> Co-authored-by: Christophe Blaess <christophe.blaess@logilin.fr>
> ---
>  package/busybox/busybox.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

We normally don't really care about such issue, because it only occurs
when you do a full build, change the configuration, and then run "make"
again, without doing a full clean build. Buildroot never guarantees
that the build output will be correct in such situations.

But well, in this specific case it is very cheap to do, so ok, fair
enough.

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
