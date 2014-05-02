From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 May 2014 17:45:38 +0200
Subject: [Buildroot] [PATCH] zeromq: disable test using fork() when
 fork() is no available
In-Reply-To: <1399040498-30168-1-git-send-email-s.martin49@gmail.com>
References: <1399040498-30168-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20140502174538.34097974@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Fri,  2 May 2014 16:21:38 +0200, Samuel Martin wrote:
> zeromp's configure script correctly detects the fork availability, but
> unconditionally build all tests.
> 
> This patch just disables the piece of code using fork() in the given
> test. This avoids the autoreconf step of the package.

Huh, but then it completely breaks the test, no? Would it be better to
find an upstreamable solution instead?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
