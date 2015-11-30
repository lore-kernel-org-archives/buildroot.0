From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Nov 2015 23:32:54 +0100
Subject: [Buildroot] [PATCH v3] lighttpd: add option to enable php-fpm
 configuration
In-Reply-To: <1430611794-12123-2-git-send-email-bos@je-eigen-domein.nl>
References: <1430611794-12123-1-git-send-email-bos@je-eigen-domein.nl>
 <1430611794-12123-2-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20151130233254.3bacb82d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Sun,  3 May 2015 02:09:54 +0200, Floris Bos wrote:
> If both lighttpd and php-fpm are selected, offer to
> enable PHP in the lighttpd configuration.
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Thanks for your patch. Your patch is well-documented and written, but
after some discussion on IRC, we believe that the sort of custom
configuration you are doing belongs more to your rootfs overlay +
post-build script than to an option in the official Buildroot.

Indeed, we could add zillions of options to customize all aspects of
lighttpd, but it would be a nightmare to maintain in Buildroot. So we
try to stick with mainly compile-time configuration of lighttpd,
installing a minimally working configuration file by default. The rest
of the runtime configuration should be done in each user's rootfs
overlay and post build scripts.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
