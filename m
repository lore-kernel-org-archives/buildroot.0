From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jan 2016 14:57:27 +0100
Subject: [Buildroot] [PATCH v2] netsniff-ng: check if linux-headers are
 v3.0 or higher
In-Reply-To: <1452864217-2503-1-git-send-email-joris.lijssens@gmail.com>
References: <1452864217-2503-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <20160115145727.2854e65c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joris,

On Fri, 15 Jan 2016 14:23:37 +0100, Joris Lijssens wrote:
> Fixes:
> http://autobuild.buildroot.net/results/c87a440e29ae387f600cb6ecce3caa

This URL gives a 404. The correct address is:

http://autobuild.buildroot.net/results/c87/c87a440e29ae387f600cb6ecce3caaa08557f4f0/

Also, it's good to give a few more details, like:

netsniff-ng uses the TP_STATUS_VLAN_VALID define, provided by the
kernel headers. This definition has been added in the kernel by commit
a3bcc23e890a6d49d6763d9eb073d711de2e0469 ("af-packet: Add flag to
distinguish VID 0 from no-vlan"), which was merged in v3.0.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
