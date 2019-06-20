From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 16:36:39 +0200
Subject: [Buildroot] [PATCH 23/27] package/tvheadend: fix PIE build
 failures
In-Reply-To: <20190614210346.121013-24-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-24-giulio.benetti@micronovasrl.com>
Message-ID: <20190620163639.60ffebd4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Jun 2019 23:03:42 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> Package tvheadend builds using '-pie' linker flag in any case. This
> leads to linking failure if toolchain doesn't support 'pie'.
> 
> Add patch to fix tvheadend's Makefile bug where '-pie' flag is hardcoded
> making it depend on '--disable-pie' as compiler's flags already are
> treated.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  ...pie-linking-according-to-disable-pie.patch | 34 +++++++++++++++++++
>  package/tvheadend/tvheadend.mk                |  4 +++
>  2 files changed, 38 insertions(+)
>  create mode 100644 package/tvheadend/0002-Makefile-fix-pie-linking-according-to-disable-pie.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
