From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 15 Feb 2018 08:39:00 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-02-14
In-Reply-To: <20180215070039.30E972081E@mail.free-electrons.com>
References: <20180215070039.30E972081E@mail.free-electrons.com>
Message-ID: <CANQCQpb4buukSXdoV8KvwZ9SUFJxX3uiggoFE7RJyh-jHVhR2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Feb 15, 2018 at 1:00 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Build statistics for 2018-02-14
[snip]

> microblazeel |                     gst-ffmpeg | TIM | http://autobuild.buildroot.net/results/ac6079ca20e922e635df00d3fdb472616bb702e2 |
>          arm |                      host-mono | TIM | http://autobuild.buildroot.net/results/00b98df10be21a1134f67d60a8465c8f81fe557b |

For these too, it looks like their builds take > 2hrs for the "build"
step.  I'll try and characterize and send a bump in the duration we
use for hung package builds.

Another item I noticed is the duration bookkeeping in the
import.inc.php needs update to append the hung period in sec if the
build timed out.  Currently the duration listed is the time the build
has taken before it hung for 2hrs.  I'm unsure if we want that update
to the duration to be made or just assume that the hung timeout is on
top of that duration listed.  Thus just keeping the actual build time
as the reported duration.

Matt
