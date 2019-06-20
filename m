From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 18:13:59 +0200
Subject: [Buildroot] [PATCH 22/27] package/haproxy: re-enable package on
 microblaze
In-Reply-To: <20190614210346.121013-23-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-23-giulio.benetti@micronovasrl.com>
Message-ID: <20190620181359.6ed46ea5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Jun 2019 23:03:41 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> With Microblaze Gcc version < 8.x build gives:
> 'internal compiler error: in do_output_reload, at reload1.c:7978'
> This is due to bug 90620:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620. To avoid this, the
> haproxy package has a !BR2_microblaze dependency. However, gcc bug
> 90620 only triggers when optimization is enabled, so we can work
> around the issue by passing -O0, which is what we do in other
> Buildroot packages to work around this bug.
> 
> So, this commit passes -O0 when BR2_TOOLCHAIN_HAS_GCC_BUG_90620, and
> re-enables haproxy on Microblaze.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/haproxy/Config.in  | 2 --
>  package/haproxy/haproxy.mk | 9 ++++++++-
>  2 files changed, 8 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
