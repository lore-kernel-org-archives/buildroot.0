From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Aug 2012 09:02:32 +0200
Subject: [Buildroot] [PATCH] libpng: bump version and add apng support
 (required by firefox)
In-Reply-To: <50240DDE.4000901@petroprogram.com>
References: <50240DDE.4000901@petroprogram.com>
Message-ID: <20120810090232.7ca6f885@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stefan,

Le Thu, 09 Aug 2012 22:22:06 +0300,
Stefan Fr?berg <stefan.froberg@petroprogram.com> a ?crit :

> Signed-off-by: Stefan Froberg <stefan.froberg@petroprogram.com>
> ---

Thanks for this patch. A few comments:

 (1) Your patch has been line-wrapped by your e-mail client. Try to use
     git send-email instead, which will guarantee that your patch
     remains intact and can be applied properly.

 (2) As far as I know, the bump from libpng 1.4 to libpng 1.5 changes
     the API, and is therefore causing build failures in other
     packages. Have you tested things like DirectFB and other packages
     that rely on libpng?

 (3) Is this apng feature something that is being integrated in the
     upstream version of libpng? In Buildroot, we don't like carrying
     patches that add features to packages. Imagine we later want to
     bump libpng to version 1.5.10 or 1.5.11, we'd have to refresh the
     patch, which becomes complicated if we accumulate many large
     patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
