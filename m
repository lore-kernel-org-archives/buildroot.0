From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 16:44:13 +0200
Subject: [Buildroot] [PATCH 2/2] xen: Remove TARGET_CONFIGURE_OPTS from
 make
In-Reply-To: <20160917160947.1b29638d@free-electrons.com>
References: <1473799504-20372-1-git-send-email-alistair.francis@xilinx.com>
 <1473799504-20372-2-git-send-email-alistair.francis@xilinx.com>
 <dd89e679-681d-a3e6-b37e-1beea8744937@mind.be>
 <20160917160947.1b29638d@free-electrons.com>
Message-ID: <20160917164413.5385d83f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Sep 2016 16:09:47 +0200, Thomas Petazzoni wrote:

> So apparently, the fact that we are passing our own CFLAGS confuses the
> Xen build system, which then adds its own CFLAGS twice for some reason.

Looking at the Xen Git history, this __OBJECT_FILE__ definition is new
in 4.7.0 and did not exist in 4.6.0. So, this "duplication" of CFLAGS
most likely already occurred with Xen 4.6.0, but was not noticed due to
the fact that all other options can be passed several times.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
