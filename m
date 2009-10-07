From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Oct 2009 12:02:20 +0200
Subject: [Buildroot] [PATCH 15/23] qt: make sure to install all Qt-fonts
 and true-type-fonts
In-Reply-To: <1254907246-5650-16-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-16-git-send-email-mroth@nessie.de>
Message-ID: <20091007120220.64ab7acb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  7 Oct 2009 11:20:38 +0200,
Michael Roth <mroth@nessie.de> a ?crit :

> Qt gained some more qpf-fonts and also provides some true-type-fonts.
> Make sure to install them all inclusive ttf-fonts when
> freetype-support is enabled. Additionally the empty 'fontdir' file is
> really not needed.
> 
> Signed-off-by: Michael Roth <mroth@nessie.de>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Even though this test:

ifneq ($(BR2_PACKAGE_QT_NOFREETYPE),y)

is really segfaulting my brain. You're not testing whether a not option
is not equal to not yes. Maybe we should s/QT_NOFREETYPE/QT_FREETYPE/
and reverse all the logic :-)

not (! Thomas)
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
