From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 00:08:45 +0200
Subject: [Buildroot] [PATCH 1/5] Introduce KDE Frameworks 5 packages
In-Reply-To: <20180215204815.14707-1-pinaraf@pinaraf.info>
References: <20180215204815.14707-1-pinaraf@pinaraf.info>
Message-ID: <20180701000845.2df59275@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Feb 2018 21:48:11 +0100, Pierre Ducroquet wrote:
> KDE Frameworks 5 is a set of libraries built on the Qt framework providing a
> lot of powerfull classes and solutions for developers building Qt
> applications.
> Unlike the previous KDE libraries, they are split in tiny packages, reducing
> dependencies as much as possible, making them usable even for embedded
> projects.
> 
> This first commit introduce the kf5 packages folder
> 
> Signed-off-by: Pierre Ducroquet <pinaraf@pinaraf.info>

I've applied this patch to master. First, I fixed the commit title,
because we have the policy of using commit titles like this:

	<package>: <description>

I also fixed the Config.in.help text which had too long lines and
trailing spaces. Please make sure to use check-package to verify such
coding style issues.

> +	depends on BR2_PACKAGE_QT5

I added a dependency on BR2_PACKAGE_QT5_VERSION_LATEST, because at
least kf5-networkmanager-qt needed Qt5 >= 5.8.

> +KF5_VERSION_MAJOR = 5.43

This version wasn't available anymore, so I switched to 5.47 instead.
It's a bit annoying if they remove old versions, though. Perhaps
something to tell upstream not to do.

> +KF5_VERSION = $(KF5_VERSION_MAJOR).0
> +KF5_SITE = https://download.kde.org/stable/frameworks/$(KF5_VERSION_MAJOR)
> +
> +include $(sort $(wildcard package/kf5/*/*.mk))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
