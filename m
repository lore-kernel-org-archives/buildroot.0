From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Dec 2013 14:45:19 +0100
Subject: [Buildroot] [PATCH] qt5connectivity: new package
In-Reply-To: <1387890510-2069-1-git-send-email-fatih.asici@gmail.com>
References: <1387890510-2069-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <20131224144519.5a88c023@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fatih A??c?,

On Tue, 24 Dec 2013 15:08:30 +0200, Fatih A??c? wrote:
> QtNfc is not installed since it is not supported on Linux.
> 
> Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> ---
>  package/qt5/Config.in                          |  1 +
>  package/qt5/qt5connectivity/Config.in          | 13 +++++++
>  package/qt5/qt5connectivity/qt5connectivity.mk | 49 ++++++++++++++++++++++++++
>  3 files changed, 63 insertions(+)
>  create mode 100644 package/qt5/qt5connectivity/Config.in
>  create mode 100644 package/qt5/qt5connectivity/qt5connectivity.mk

Thanks for doing this!


> +config BR2_PACKAGE_QT5CONNECTIVITY
> +	bool "qt5connectivity"
> +	select BR2_PACKAGE_BLUEZ_UTILS

You need to propagate the Bluez Utils dependency "depends
on !BR2_avr32" here. And also the depends on BR2_USE_MMU.

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
