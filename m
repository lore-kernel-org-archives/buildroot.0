From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Feb 2014 19:42:29 +0100
Subject: [Buildroot] [PATCH v4 1/4] beaglebone: update to TI 3.12 kernel
In-Reply-To: <1392021600-32293-2-git-send-email-anders@chargestorm.se> (Anders
 Darander's message of "Mon, 10 Feb 2014 09:39:57 +0100")
References: <1392021600-32293-1-git-send-email-anders@chargestorm.se>
 <1392021600-32293-2-git-send-email-anders@chargestorm.se>
Message-ID: <878utizu5m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anders" == Anders Darander <anders@chargestorm.se> writes:

 > Git repo version is taken from meta-ti.
 > It's a 3.12.10 kernel with TI's own patches on top.

 > The defconfig has been kept rather close to our old defconfig.
 > The kernel has been boot-tested using an NFS-root.

 > Apart from the kernel change, the linux headers has also been
 > updated from 3.8.12 to 3.12.10.

 > Signed-off-by: Anders Darander <anders@chargestorm.se>
 > ---
 >  .../{linux-3.8.config => linux-3.12.config}        | 104 ++++++++++++++-------
 >  configs/beaglebone_defconfig                       |   6 +-
 >  2 files changed, 75 insertions(+), 35 deletions(-)
 >  rename board/beaglebone/{linux-3.8.config => linux-3.12.config} (68%)

 > @@ -58,44 +84,45 @@ CONFIG_IP_PNP_RARP=y
 >  # CONFIG_INET_LRO is not set
 >  # CONFIG_IPV6 is not set
 >  # CONFIG_WIRELESS is not set
 > +CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"

Given the recent mdev discussion and the fact that we don't have any
packages providing /sbin/hotplug I've dropped this.

Committed with this fixed, thanks.

-- 
Bye, Peter Korsgaard
