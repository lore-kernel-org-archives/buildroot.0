From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Mar 2018 20:15:46 +0100
Subject: [Buildroot] [PATCH] package/busybox: Unbreak the `tar`
 implementation
In-Reply-To: <7ef483c1c968c34ed094a3fc883db230a598bc40.1521047794.git.jan.kundrat@cesnet.cz>
 ("Jan =?utf-8?Q?Kundr=C3=A1t=22's?= message of "Wed, 14 Mar 2018 17:58:40
 +0100")
References: <7ef483c1c968c34ed094a3fc883db230a598bc40.1521047794.git.jan.kundrat@cesnet.cz>
Message-ID: <877eqeii3h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jan" == Jan Kundr?t <jan.kundrat@cesnet.cz> writes:

 > The `tar` implementation in Busybox 1.28.0 and 1.28.1 won't extract a
 > rootfs with some symlinks that appear to look "dangerous". This
 > completely (and silently!) breaks on-target updates via RAUC for me, for
 > example.

 > In the meanwhile, upstream already reverted the commit in question
 > (in their commit a84db18fc71d09e801df0ebca048d82e90b32c6a), so this
 > patch simply applies that revert in Buildroot. The fix has not made it
 > to a release, yet.

 > Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
 > Bug: https://bugs.busybox.net/show_bug.cgi?id=8411
 > Bug: https://github.com/rauc/rauc/issues/249

Committed, thanks.

-- 
Bye, Peter Korsgaard
