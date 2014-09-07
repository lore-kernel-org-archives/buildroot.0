From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 07 Sep 2014 21:55:49 +0200
Subject: [Buildroot] [PATCH] libiscsi: add patch to fix largefile
	related issues
In-Reply-To: <1410092605-5592-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 7 Sep 2014 14:23:25 +0200")
References: <1410092605-5592-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871trnkxx6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit adds a patch to libiscsi, to fix largefile related issues
 > occuring in two situations:

 >  * glibc toolchains, due to the way _FILE_OFFSET_BITS=64 is handled,
 >    by declaring the *64() functions as aliases to the non-64*() ones.

 >  * uClibc toolchains without largefile support.

 > First problem was visible in:

 >   http://autobuild.buildroot.org/results/b52/b52782c7ada0db098620bd8eceedd7b84515446b/

 > Second problem was visible in:

 >   http://autobuild.buildroot.org/results/23c/23c27fc7c4836dfd2527e52d95d5e72905ece7be/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
