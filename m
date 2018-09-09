From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:32:21 +0200
Subject: [Buildroot] [PATCH 1/3] package/Makefile.in: Use '-isystem'
 instead of '-I' in HOST_CFLAGS globally
In-Reply-To: <20180831142024.27548-1-david.degrave@mind.be>
References: <20180831142024.27548-1-david.degrave@mind.be>
Message-ID: <20180909153221.6b803c9f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

On Fri, 31 Aug 2018 16:20:22 +0200, David De Grave (Essensium/Mind)
wrote:
>  As the $(HOST_DIR) is the buildroot's system install directory, and that
> all the builds should use that one in priority (it's even mandatory for
> uboot and linux), it make sense to use '-isystem' to ensure it is searched
> right before the system directories and still let the possibility for the
> packages to use specific ones using '-I'.

Could you give a few more details about the motivation for this change.
Is it just because it is "cleaner" to refer to Buildroot
$(HOST_DIR)/include using -isystem, or does this fix some actual
problem/build issue ?

Doing such a change is pretty invasive, it could potentially cause
some build failures, so I'd like to understand the motivation.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
