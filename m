From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 21:52:20 +0200
Subject: [Buildroot] [PATCH v3] package/qt5location: handle plugins
 being conditionally built
In-Reply-To: <1500925803-3453-1-git-send-email-joshua.henderson@microchip.com>
References: <1500925803-3453-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20170725215220.6d447778@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Jul 2017 12:50:03 -0700, Joshua Henderson wrote:
> Fixes a build issue [1] where the qt5location plugins are not built, but are
> attempted to be installed by buildroot.
> 
> The qt5location plugins have dependencies that are automatically and incorrectly
> resolved causing plugins to conditionally be built based on whether quick is
> available. This change adds a patch for an upstream bug [2] that builds the
> plugins directory irrelevant of the quick module.
> 
> [1] http://autobuild.buildroot.net/results/bc1/bc13abf3bb2fe1c991aec2334ee658c9641d1fd5/build-end.log
> [2] https://bugreports.qt.io/browse/QTBUG-62098
> 
> Cc: Julien Corjon <corjon.j@ecagroup.com>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> 
> --
> 
> Changes for v3:
> - Change commit message to be more inline with actual fix.
> - Issue with upstream patch - use Peter's upstream patch instead.
> 
> Changes for v2:
> - Instead of skipping missing files, fix the root cause of improper dependency
>   on quick when building the position plugin.
> ---
>  ...001-Fix-plugins-build-dependency-tracking.patch | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/qt5/qt5location/5.9.1/0001-Fix-plugins-build-dependency-tracking.patch

Thanks, but Peter had sent an almost identical patch a few hours
before, and I've applied his patch.

Thanks a lot for all this work on Qt5, much appreciated! Note that we
still have a build failure of qt5webkit 5.6.1:

  http://autobuild.buildroot.net/results/2f3/2f381967c82775ad911a246a9607034ef489c1ce/build-end.log

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
