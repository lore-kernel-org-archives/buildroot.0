From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 22:06:23 +0200
Subject: [Buildroot] [PATCH] acpid: drop x86 architecture dependency
In-Reply-To: <20180827160701.13990-1-peter@korsgaard.com>
References: <20180827160701.13990-1-peter@korsgaard.com>
Message-ID: <20180829220623.486a1b05@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Aug 2018 18:07:01 +0200, Peter Korsgaard wrote:
> Closes #11241
> 
> While ACPI is historically exclusively a x86 feature, ia64 and (some) arm64
> server platforms also use it.  Furthermore, even if the firmware does not
> provide an ACPI interface and/or the kernel is not built with ACPI support,
> acpid can still be used to command an orderly shutdown of the system as it
> also listens for KEY_POWER / KEY_SUSPEND events from the input subsystem
> (and calls shutdown by default).
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/acpid/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Applied to next, thanks. Even though it's fixing what was reported as a
bug, I don't think this qualifies as a bug, so I've applied to next and
not to master.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
