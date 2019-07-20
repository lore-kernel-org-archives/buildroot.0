From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jul 2019 21:50:15 +0200
Subject: [Buildroot] [PATCH v2 2/2] boot/opensbi: Implement a choice for
 the OpenSBI Platform
In-Reply-To: <20190709223649.25630-2-alistair.francis@wdc.com>
References: <20190709223649.25630-1-alistair.francis@wdc.com>
 <20190709223649.25630-2-alistair.francis@wdc.com>
Message-ID: <20190720215015.6dbc6b97@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alistair,

On Tue,  9 Jul 2019 15:36:49 -0700
Alistair Francis <alistair.francis@wdc.com> wrote:

> Instead of requiring users to look at the OpenSBI source code and
> determine the platform string let's use a choice option to allow them to
> specify the platform they would like to target. We still allow them to
> specify a custom string if they want to.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

I have not applied this patch, because we don't do this anywhere in
Buildroot. For things like U-Boot, Linux or Barebox, the name of the
platform/configuration is always a free-form string. Having an explicit
list of platform is difficult to maintain as the list of platforms can
be huge. Also the list of supported platforms can differ from one
version to the other (in the case where the version itself is
configurable). In addition, how do you draw the line between platforms
that should be explicitly listed in the Config.in choice, and the ones
for which users should use the free-form string option.

But again, the main reason for rejecting is that in exactly this
situation in other packages in Buildroot, we use a simple free-form
string.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
