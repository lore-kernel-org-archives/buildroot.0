From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 12:47:25 +0100
Subject: [Buildroot] [PATCH 0/11 v5] weston: new freerdp backend (branch
 yem/freerdp)
In-Reply-To: <20150222121305.6ca281ab@free-electrons.com>
References: <cover.1424558036.git.yann.morin.1998@free.fr>
 <20150222121305.6ca281ab@free-electrons.com>
Message-ID: <20150222124725.68cdc4f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Feb 2015 12:13:05 +0100, Thomas Petazzoni wrote:

> >       package/weston: add support for the RDP compositor
> 
> This one I believe has a real issue, I'll reply to it specifically.

In fact no, I misread the patch, it is all fine, so I applied it.

However, I encountered one build issue caused by CLOCK_BOOTTIME not
being defined by uClibc. There's a patch in uClibc master of course,
but it's not in 0.9.33.2. So I added a patch to Weston to make it build
by defining CLOCK_BOOTTIME to the right value when not already defined
by the C library headers.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
