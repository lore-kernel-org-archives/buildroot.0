From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 16:15:38 +0200
Subject: [Buildroot] [PATCH] infra: simplify .la/.pc fixup commands
In-Reply-To: <6d38fb9f8bb567d8a4a2.1404044185@localhost>
References: <6d38fb9f8bb567d8a4a2.1404044185@localhost>
Message-ID: <20140629161538.35a3c17c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 29 Jun 2014 14:16:25 +0200, Thomas De Schampheleire wrote:

> The commands fixing up .la and .pc files in the pkg-generic and
> pkg-autotools infrastructures can be simplified a little, since STAGING_DIR
> already contains BASE_DIR.

Is this assumption really correct? If the user decides to move
$(HOST_DIR) in some custom location using BR2_HOST_DIR, it also means
that $(STAGING_DIR) is moved to this custom location. So you can have a
case where:

	BASE_DIR = /home/joe/buildroot/output
	HOST_DIR = /opt/arm-build
	STAGING_DIR = /opt/arm-build/usr/arm-unknown-linux-uclibcgnueabi/sysroot/

No ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
