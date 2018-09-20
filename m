From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Sep 2018 07:07:39 +0200
Subject: [Buildroot] [PATCH] musl: add upstream patch to fix race
 condition in file locking
In-Reply-To: <20180919064424.12185-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 19 Sep 2018 08:44:24 +0200")
References: <20180919064424.12185-1-thomas.petazzoni@bootlin.com>
Message-ID: <87k1ngpxic.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > According to [1]:
 >   musl 1.1.20 introduced a regression in stdio FILE locking that can
 >   cause soft deadlocks with >2 threads contending for a
 >   FILE. Users/dists should apply
 >   https://git.musl-libc.org/cgit/musl/commit/?id=0db393d3a77bb9f300a356c6a5484fc2dddb161d.

 > [1] https://twitter.com/musllibc/status/1042292786568024070

 > This commit therefore adds the corresponding patch to the musl
 > package.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
