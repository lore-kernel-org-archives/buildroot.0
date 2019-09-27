From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 27 Sep 2019 12:09:26 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-09-25
In-Reply-To: <20190926061635.076C087C89@hemlock.osuosl.org>
References: <20190926061635.076C087C89@hemlock.osuosl.org>
Message-ID: <CANQCQpawzY=WiSPSFpmhiae9oN+HFj0ogTJsLKhQFX-mFLrAug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,


On Thu, Sep 26, 2019 at 1:16 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Autobuild statistics for 2019-09-25
> ===============================
>

[snip]

>     arm      |          hostapd-2.9           | NOK | http://autobuild.buildroot.net/results/36e6e2662f89024defa83749d102d093b1f0a637 |
>     arm      |          hostapd-2.9           | NOK | http://autobuild.buildroot.net/results/f39a45e1e6ddcd5b3438f52e14ee78872775823b |
>   sparc64    |          hostapd-2.9           | NOK | http://autobuild.buildroot.net/results/f5dff2e7321568f0555ee3b975ff83bb9536fedf |

It looks like there must have been another configuration item in the
recent bump that didn't quite get flushed all the way through the make
options.

NEED_LINUX_IOCTL=y  needs to be set so that linux_br_* is defined.
Sergey, did you notice anything like this in your wpa_supplicant
fixups?

Matt
