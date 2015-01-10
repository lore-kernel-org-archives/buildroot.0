From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 11:39:24 +0100
Subject: [Buildroot] [PATCH] package/xz-utils: does not require threads
In-Reply-To: <1420823005-950-1-git-send-email-yann.morin.1998@free.fr>
References: <1420823005-950-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150110113924.7ef9717f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri,  9 Jan 2015 18:03:25 +0100, Yann E. MORIN wrote:
> Commit 799c12e (xz-utils: needs threads) tried to fix an autobuild
> failure by requiring threads. But xz-utils can be configured without
> thread support (even though it is one of the most prominent
> selling-points of the latest release!).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Thanks, applied, after doing a minor tweak: use
--enable-threads/--disable-threads instead of
--enable-threads={yes,no}, to match what we do most often in autotools
packages.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
