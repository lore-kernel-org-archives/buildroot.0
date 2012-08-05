From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Aug 2012 23:26:56 +0200
Subject: [Buildroot] [PATCH] package/crosstool-ng: update to 1.16.0
In-Reply-To: <201208052248.32983.yann.morin.1998@free.fr>
References: <1344197156-20586-1-git-send-email-yann.morin.1998@free.fr>
 <20120805221832.0d7d45ae@skate>
 <201208052248.32983.yann.morin.1998@free.fr>
Message-ID: <20120805232656.4b952d9a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 5 Aug 2012 22:48:32 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> Yes, it would be nice, but there's no provision in crosstool-NG to use a
> defconfig file, except from the bundeled samples.

Well, then we can do just like we do for the kernel:

	install -D crosstool-ng.config $(CROSSTOOL_NG_BUILD_DIR)/samples/buildroot/crosstool-ng.config
	ct-ng buildroot
	ct-ng build

And there you are :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
