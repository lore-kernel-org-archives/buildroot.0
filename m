From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Dec 2018 23:19:05 +0100
Subject: [Buildroot] [PATCH 1/1] quagga: fix static build with musl
In-Reply-To: <20181201215953.6966-1-fontaine.fabrice@gmail.com>
References: <20181201215953.6966-1-fontaine.fabrice@gmail.com>
Message-ID: <20181201231905.0bc5820e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Dec 2018 22:59:53 +0100, Fabrice Fontaine wrote:

> ++AC_ARG_ENABLE(embedded-getopt,
> ++    AS_HELP_STRING([--disable-embedded-getopt], [disable embedded getopt functions]))

Instead of another --enable option, what about auto-detecting if the C
library provides getopt() ?

Isn't AC_CHECK_FUNC([getopt]) sufficient ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
