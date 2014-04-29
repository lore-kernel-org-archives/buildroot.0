From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Apr 2014 00:54:19 +0200
Subject: [Buildroot] [PATCH v2 1/1] xlib_libXpm: needs MMU (fork)
In-Reply-To: <20140429200722.GQ4531@tarshish>
References: <1398800256-11508-1-git-send-email-bernd.kuhls@t-online.de>
 <20140429200722.GQ4531@tarshish>
Message-ID: <20140430005419.6f1a456a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 29 Apr 2014 23:07:22 +0300, Baruch Siach wrote:

> This dependency should be propagated further recursively. Many packages select 
> BR2_PACKAGE_XLIB_LIBXAW and all of them must also depend on BR2_USE_MMU.

Maybe we should take a step back and see if libXpm could be fixed to
not use fork() at all, or use vfork().

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
