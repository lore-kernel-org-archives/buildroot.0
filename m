From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Sep 2011 23:18:23 +0200
Subject: [Buildroot] [PATCH v2] New package: bluez-utils
In-Reply-To: <4E5CE74B.7040104@visionsystems.de> (Yegor Yefremov's message of
 "Tue, 30 Aug 2011 15:36:11 +0200")
References: <4E5CE74B.7040104@visionsystems.de>
Message-ID: <87hb3zvw80.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> Bluetooth utils often used in embedded system, add it to package.

Committed with a minor fix, thanks.

 Yegor> +config BR2_PACKAGE_BLUEZ_UTILS
 Yegor> +	bool "bluez-utils"
 Yegor> +	depends on BR2_USE_WCHAR # libglib2
 Yegor> +	select BR2_PACKAGE_DBUS

DBUS depends on expat/libxml2 so I added

	select BR2_PACKAGE_EXPAT if !BR2_PACKAGE_DBUS_LIBXML2

-- 
Bye, Peter Korsgaard
