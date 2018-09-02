From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Sep 2018 22:03:39 +0200
Subject: [Buildroot] [PATCH 1/1] chipmunk: fix build on musl
In-Reply-To: <20180902162340.24253-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 2 Sep 2018 18:23:40 +0200")
References: <20180902162340.24253-1-fontaine.fabrice@gmail.com>
Message-ID: <875zzn4qg4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build fails on:
 > /home/test/autobuild/run/instance-0/output/build/chipmunk-7.0.2/src/cpHastySpace.c:11:24:
 > fatal error: sys/sysctl.h: No such file or directory

 > Indeed, sys/sysctl.h is not available on musl so include this header
 > only if __APPLE__ is defined as sysctlbyname is only used in this case.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/e5be2f8eb9315a9054e1c8d854dec37cbb28eed7

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
