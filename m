From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 22 Feb 2014 22:40:22 +0100
Subject: [Buildroot] [PATCH] libcgi: fix build failure on pure static
	library builds
In-Reply-To: <1393103520-9012-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 22 Feb 2014 22:12:00 +0100")
References: <1393103520-9012-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871tyusu61.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > libcgi always builds both the shared and static library, which doesn't
 > work on architecture that don't support shared library at all, such as
 > Blackfin with the FLAT format. libcgi uses autoconf, but not automake,
 > and the Makefile is not of the highest possible quality, so this
 > commit fixes the problem by introducing a "STATIC" variable that can
 > be set from the environment. When set to a non-empty value, the
 > Makefile assumes it should only build the static version of the
 > library.

 > Note that this package is in desperate need of some care: there is one
 > single patch that mixes several changes together, it doesn't have a
 > description or a Signed-off-by line, and there is now a github project
 > for libcgi at https://github.com/rafaelsteil/libcgi/ that has the same
 > fixes.

 > However, for the purpose of the master branch, we're doing the most
 > minimal fix possible, by just adding this STATIC variable.

 > Fixes:

 >   http://autobuild.buildroot.net/results/625/625105bcaf26345f422b225787fc19611b65cd57/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
