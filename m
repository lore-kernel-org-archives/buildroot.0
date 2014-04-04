From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 4 Apr 2014 15:55:32 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-03
In-Reply-To: <20140404063010.00CF61015BE@stock.ovh.net>
References: <20140404063010.00CF61015BE@stock.ovh.net>
Message-ID: <20140404135530.GA26146@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
On Fri, Apr 04, 2014 at 08:30:09AM +0200, Thomas Petazzoni wrote:

>        arm |                    systemd-212 | NOK | http://autobuild.buildroot.net/results/3546c003a8fcbb36ef5ba29c00a96e473b927ecb/
This failure is due to systemd now using the `--relative` option of `ln(1)`
from GNU coreutils. This option was added to GNU coreutils 8.16, but some
GNU/Linux distributions like Debian Wheezy or Ubuntu 12.04 ship 8.13. It looks
like the Autobuild server runs one of these :-) . Our users may be in this
situation and may not want to upgrade.

I'll post a fix, but would Buildroot benefit from installing host-coreutils to
avoid this kind of problem?

Best regards,
ELB
