From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Oct 2020 18:08:53 +0100
Subject: [Buildroot] [PATCH v2] package/dvb-apps: fix build failure with
 glibc 2.31
In-Reply-To: <20200926170920.716-1-daggs@gmx.com> (Dagg Stompler's message of
 "Sat, 26 Sep 2020 20:09:20 +0300")
References: <20200926170920.716-1-daggs@gmx.com>
Message-ID: <87wnzai8gq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dagg" == Dagg Stompler <daggs@gmx.com> writes:

 > dvb-apps fails to build with glibc 2.31 with the following error:
 > | dvbdate.c: In function set_time:
 > | dvbdate.c:312:6: warning: implicit declaration of function stime; did you mean ctime? [-Wimplicit-function-declaration]
 > | 312 | if (stime(new_time)) {
 > | | ^~~~~
 > | | ctime

 > Fixes:

 > http://autobuild.buildroot.net/results/95f30c5e6af2274418bb44a20da7caac69f1dd68/

 > references:
 > 1. https://gitweb.gentoo.org/repo/gentoo.git/commit/media-tv/linuxtv-dvb-apps/files/linuxtv-dvb-apps-glibc-2.31.patch?id=eb705f892eae45b93306c1de1407c1c22ac23956
 > 2. https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=964223

 > Signed-off-by: Dagg Stompler <daggs@gmx.com>
 > ---
 > Changes v1 -> v2:
 >  1. fix coomit header (Thomas Petazzoni)
 >  2. add reference to autobuilder failure (Thomas Petazzoni)
 >  3. rework patch (Thomas Petazzoni)
 >  4. added maintainer to CC

Committed to 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
