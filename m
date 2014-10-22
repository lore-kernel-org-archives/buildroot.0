From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 22:53:53 +0200
Subject: [Buildroot] [PATCH] qt5connectivity: propagate bluez-utils
 dependencies
In-Reply-To: <1413820376-11771-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1413820376-11771-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141022225353.3731b2e4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 20 Oct 2014 16:52:56 +0100, Vicente Olivert Riera wrote:
> qt5connectivity selects the bluez-utils package but the dependencies are
> not fully propagated so someone could do a static build, then select the
> qt5connectivity package causing bluez-utils being auto-selected, which
> is disabled for static builds, and then obtain a build failure like this
> one:
> 
> checking for dlopen in -ldl... no
> configure: error: dynamic linking loader is required
> 
> Fixes:
> 	http://autobuild.buildroot.net/results/96d/96d8297be0b731da138b1e2aafb851061aee3c40/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/qt5/qt5connectivity/Config.in |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
