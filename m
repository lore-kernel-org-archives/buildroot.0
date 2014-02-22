From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 22 Feb 2014 21:26:23 +0100
Subject: [Buildroot] [PATCH] aiccu: disable on AVR32
In-Reply-To: <1393094615-13012-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 22 Feb 2014 19:43:35 +0100")
References: <1393094615-13012-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8738jauc5s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > In commit 87492d244a1dbf6114bb464e8d8dbedcf08fb399 ("aiccu: disable
 > for uClibc 0.9.31/0.9.32"), we made sure it was not possible to select
 > aiccu with uClibc 0.9.31 and 0.9.32, because they lack dn_skipname().

 > However, we still have the problem that external AVR32 toolchains can
 > select aiccu, which causes build failures. Therefore, we also disallow
 > aiccu on AVR32 altogether. We keep the 0.9.31/0.9.32 exclusions,
 > because if they are used on other architectures, it would also fail
 > due to the lack of dn_skipname().

 > Fixes:

 >   http://autobuild.buildroot.org/results/a24/a2490d434152625d9208615d83f4c5d6daea79d0/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
