From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:38:21 +0100
Subject: [Buildroot] [PATCH v4 1/2] package/linuxptp: make initscript
 options configurable
In-Reply-To: <20200312190434.973-2-heiko.thiery@gmail.com>
References: <20200312190434.973-1-heiko.thiery@gmail.com>
 <20200312190434.973-2-heiko.thiery@gmail.com>
Message-ID: <20200314153821.1d87f14c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 12 Mar 2020 20:04:34 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> The "package/busybox/S01sysklogd" is taken as template to change the
> init script of the linuxptp daemon. The init script is split two parts
> because there are 2 daemons (ptp4l and phc2sys).
> 
> Let the user supply its own options in /etc/default/ptp4l and
> /etc/default/phc2sys.
> 
> This patch also fixes an issue with the creation of the pid file that is
> needed to properly stop the daemon again.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/linuxptp/S65linuxptp | 46 ----------------------------
>  package/linuxptp/S65ptp4l    | 59 ++++++++++++++++++++++++++++++++++++
>  package/linuxptp/S66phc2sys  | 59 ++++++++++++++++++++++++++++++++++++
>  package/linuxptp/linuxptp.mk |  6 ++--
>  4 files changed, 122 insertions(+), 48 deletions(-)
>  delete mode 100644 package/linuxptp/S65linuxptp
>  create mode 100644 package/linuxptp/S65ptp4l
>  create mode 100644 package/linuxptp/S66phc2sys

Applied to master after fixing the bogus comments. Thanks for the work,
and thanks Carlos for the review, testing: thanks to this
review/testing, I could blindly apply the patches.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
