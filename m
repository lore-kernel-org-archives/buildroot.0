From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 3 Sep 2008 15:35:25 +1000
Subject: [Buildroot] XYZ_AUTORECONF = YES results in two autoreconf runs
Message-ID: <20080903053525.GA12148@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Looking at Makefile.autotools.in, it appears that autoreconf is run
twice is XYZ_AUTORECONF = YES.

The xyz-configure target depends on xyz-autoreconf, and the
xyz-configure target itself runs autoreconf again.

Does anyone know a good reason for this?

thanks
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
