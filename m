From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 21:56:05 +0100
Subject: [Buildroot] [PATCH] berkeleydb: fix static linking issues
In-Reply-To: <20161204173924.GA1647@waldemar-brodkorb.de>
References: <20161204173924.GA1647@waldemar-brodkorb.de>
Message-ID: <20161204215605.680c9070@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 4 Dec 2016 18:39:24 +0100, Waldemar Brodkorb wrote:
> Libtool by default drops -static, so force libtool with -all-static
> to do static linking.

This needs a little bit more details, because libtool is used by a
large fraction of our packages, we pass -static only, and it just works.

Why do we have a different situation here? I thought this undefined
reference to `dl_iterate_phdr' issue was more a toolchain problem.
It's affecting a number of different packages, and is apparently a new
problem, so a fix at the package level looks a bit odd.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
