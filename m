From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 08:48:06 +0200
Subject: [Buildroot] [PATCH] mtd: add option to build mkfs.ubifs for
 target
In-Reply-To: <51F872B2.5080100@acm.org>
References: <20130729021746.EF4355C127@zaphod.pbhware.com>
 <20130729205101.17741846@skate> <51F872B2.5080100@acm.org>
Message-ID: <20130731084806.2270f7f3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Paul B. Henson,

On Tue, 30 Jul 2013 19:13:06 -0700, Paul B. Henson wrote:

> It looks like you copied the dependencies from util-linux? I'm not that 
> familiar with kconfig, there's no concept of transitive dependencies, 
> such that if mkfs.ubifs selects util-linux, it will automatically 
> inherit its dependencies? If I'm understanding correctly, if at some 
> point util-linux changes dependencies, the mtd config for mkfs.ubifs 
> would also need to be updated explicitly to capture them?

That's correct. When you "select FOO", kconfig ignores the dependencies
that "config FOO" may have, so you have to manually propagate them.
That's a bit annoying, but we don't have (yet?) enough understanding of
kconfig internals to change that. Yann E. Morin is getting more and
more knowledge about kconfig internals, so I'm hoping it may happen
some day, but for now, we have to propagate those dependencies manually.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
