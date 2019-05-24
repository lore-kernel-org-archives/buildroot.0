From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 May 2019 22:24:59 +0200
Subject: [Buildroot] [PATCH v2 1/7] package/sqlite: fix BUG_85180 build
 timeout
In-Reply-To: <20190522135906.30796-2-giulio.benetti@micronovasrl.com>
References: <10430096-81de-792a-8b49-c59ed5e9de2e@micronovasrl.com>
 <20190522135906.30796-1-giulio.benetti@micronovasrl.com>
 <20190522135906.30796-2-giulio.benetti@micronovasrl.com>
Message-ID: <20190524222459.2fc91773@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 May 2019 15:59:00 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> With Microblaze Gcc version < 8.x build hangs on compiling last files
> before linking.
> This is due to bug 85180:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
> Bug shows up building sqlite with optimization but not when building
> with -O0.
> 
> If BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 passing it to
> SQLITE_CFLAGS.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

I cannot reproduce this timeout, and you don't have any autobuilder
failure. Could you provide a configuration that exhibits the failure ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
