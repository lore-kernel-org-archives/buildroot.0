From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 15:47:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd: add fdisk support
In-Reply-To: <20200308231822.38941-1-james.hilliard1@gmail.com>
References: <20200308231822.38941-1-james.hilliard1@gmail.com>
Message-ID: <20200412154700.10ba1325@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  8 Mar 2020 17:18:22 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/systemd/systemd.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

I have seen the comment from Baruch, and I admit I hesitated a bit as
well. However, the fact that UTIL_LINUX_BINARIES selects
UTIL_LINUX_LIBFDISK can be seen as some "internal" detail of
util-linux. It makes sense to keep things simple and simply
enable/disable the -Dfdisk option depending on the availability of the
libfdisk library. It was not a super strong feeling from me though, so
if anybody disagree, I'm definitely willing to reconsider.

In the mean time, I've applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
