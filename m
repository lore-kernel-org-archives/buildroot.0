From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Feb 2018 23:46:22 +0100
Subject: [Buildroot] [PATCH v2] package/gpsd: add config option for
 Spectratime iSync and build fix patch
In-Reply-To: <1517694053-15488-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1517694053-15488-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20180204234622.54c315ec@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Feb 2018 22:40:53 +0100, Zoltan Gyarmati wrote:
>  As in the inital 3.17 version bump patch the iSync config option was not
> added, the iSync driver was implicitly enabled in the gpsd config as default,
> and due to a bug in the gpsd build setup, this caused several autobuild issues
> which are fixed by this. This commit adds both the Buildroot config option and
> the gpsd patch which was also sent to and accepted in upstream.
> 
> Fixes:
>     http://autobuild.buildroot.net/results/555b4bdd1707aa21e6d3014e30b635c96c5efffc
>     http://autobuild.buildroot.net/results/cfc14a2c471c63ecc4c95c12b8e00ed7656acfd2
>     http://autobuild.buildroot.net/results/2104e15526bd6f467f0d56dee10b5fa46e2c71dd
>     http://autobuild.buildroot.net/results/610b3f898b396c1def682b809482408c2c4555bc
>     ... and many more.
> 
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> ---
> Changes v1->v2:
>    * Add upstream commit link to build fix patch
> ---
>  ...x-isync-build-when-ublox-not-selected-too.patch | 36 ++++++++++++++++++++++
>  package/gpsd/Config.in                             |  5 +++
>  package/gpsd/gpsd.mk                               |  3 ++
>  3 files changed, 44 insertions(+)
>  create mode 100644 package/gpsd/0002-Fix-isync-build-when-ublox-not-selected-too.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
