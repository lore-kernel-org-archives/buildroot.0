From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 23:42:35 +0200
Subject: [Buildroot] [2018.02.x 1/2] makedevs: allow leading whitespace
 for capabilities
In-Reply-To: <20180806031715.7088-1-ricardo.martincoski@gmail.com>
References: <20180806031715.7088-1-ricardo.martincoski@gmail.com>
Message-ID: <20180809234235.47a45e5f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ricardo,

On Mon,  6 Aug 2018 00:17:14 -0300, Ricardo Martincoski wrote:
> Currently makedevs silently ignores extended attributes with leading
> whitespace, for example those added to a <PACKAGE>_PERMISSIONS following
> the recommended style from check-package.
> 
> Makedevs already ignores leading whitespace for normal entries (file
> permission changes and device files creation). Do the same for extended
> attributes.
> 
> Fixes: #11191.
> 
> Reported-by: Jean-pierre Cartal <jpcartal@free.fr>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

It is not clear to me why you have the "2018.02.x" prefix in your patch
title. I would assume this patch is needed in master, not just in
2018.02.x. We generally include 2018.02.x in the patch title when
the patch should only be applied to 2018.02.x. For patches going in
master, and needing a backport, we normally rely on Peter being smart
and realizing that the patch is a fix that makes sense for 2018.02.x.

Could you clarify what was your intention with this 2018.02.x prefix ?

Perhaps we need to have some tags ?

Backport-to: 2018.02.x

when the patch is for master, but needs to be backported. And perhaps:

Apply-to: 2018.02.x

when the patch is to be applied only on 2018.02.x.

Or simply rely on informal notes below the "---" sign ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
