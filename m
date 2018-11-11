From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Nov 2018 21:50:16 +0100
Subject: [Buildroot] [PATCH] acpid: Make bundled event files optional
In-Reply-To: <20181111150652.17459-6-alexander.sverdlin@gmail.com>
References: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
 <20181111150652.17459-6-alexander.sverdlin@gmail.com>
Message-ID: <20181111215016.4bb45836@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexander,

Adding in Cc: Carlos Santos, who recently tweakedthe powerbtn script
logic.

On Sun, 11 Nov 2018 16:06:51 +0100, Alexander Sverdlin wrote:
> On one hand the preinstalled /etc/acpi/events/powerbtn is not part of
> acpid, one other hand others might want to implement more complicated logic
> on power button. Therefore, make it optional.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

On the other hand, it makes quite a bit of sense to have some kind of
default/minimal behavior for this, which can easily be overridden in a
post-build script / root filesystem overlay.

To me, this is a little bit like "let's make the installation of the
OpenSSH server configuration file optional, because the default doesn't
suite me".

> +if BR2_PACKAGE_ACPID
> +
> +config BR2_PACKAGE_ACPID_SUPPLEMENTARY

If anything, the name of the option should be revisited, because
"supplementary" is quite vague.

But overall, I'm not really convinced that we need to change anything
here, I believe the current behavior is OK.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
