From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 01:06:30 +0200
Subject: [Buildroot] [PATCH] ntp: fix build for no-MMU with libcap
In-Reply-To: <42864d6afc883db05099a7d75a31de7e09e7ce96.1539456660.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sat, 13 Oct 2018 21:51:00 +0300")
References: <42864d6afc883db05099a7d75a31de7e09e7ce96.1539456660.git.baruch@tkos.co.il>
Message-ID: <87o9bke009.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Commit 87d759ced5 (ntp: fix build for no-MMU) added a patch to make MMU
 > dependent code hidden behind HAVE_WORKING_FORK. It turns out that the
 > patch covers too much code. When libcap is enabled we pass
 > --enable-linuxcaps, which in turn enables HAVE_DROPROOT. This adds calls
 > to code that is covered by HAVE_WORKING_FORK.

 > Update the no-MMU fix so that HAVE_WORKING_FORK only covers the no-MMU
 > incompatible routine.

 > Fixes:
 > http://autobuild.buildroot.net/results/c5c/c5cf28bb969fec7c07864cdd094dedfa4d5439d2/

 > Cc: Artem Panfilov <apanfilov@spectracom.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
