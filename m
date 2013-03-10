From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Mar 2013 12:49:44 +0100
Subject: [Buildroot] [PATCH 6/6] package/mtools: new host-package
In-Reply-To: <296699691239a90d5118c5cbe72f1ff57b3761a5.1362693294.git.yann.morin.1998@free.fr>
References: <cover.1362693294.git.yann.morin.1998@free.fr>
 <296699691239a90d5118c5cbe72f1ff57b3761a5.1362693294.git.yann.morin.1998@free.fr>
Message-ID: <20130310124944.261867c4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Luca,

Cc'ing Luca, there is a licensing infrastructure question below.

On Thu,  7 Mar 2013 22:55:31 +0100, Yann E. MORIN wrote:

> +MTOOLS_VERSION  = 4.0.18
> +MTOOLS_SOURCE   = mtools-$(MTOOLS_VERSION).tar.bz2
> +MTOOLS_SITE     = $(BR2_GNU_MIRROR)/mtools/

MTOOLS_LICENSE = GPLv3+
MTOOLS_LICENSE_FILES = COPYING

However, this makes me realize that we don't distinguish host packages
from target packages in the manifest.csv file. For example, once I had
the licensing informations for this mtools file, I have the following
line in my manifest.csv:

"mtools","4.0.18","GPLv3+","COPYING","mtools-4.0.18.tar.bz2"

And then, someone might think "damn, I have some GPLv3 software in my
system, I now need to comply with the additional special requirements
of GPLv3", while in fact it's not the case (as far as I know) because
mtools is not distributed on the embedded device. Maybe we need to
explicit which packages are on the target, which packages are on the
host, and which packages are on both, no?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
