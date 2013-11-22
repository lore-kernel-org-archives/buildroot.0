From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 22 Nov 2013 23:58:01 +0100
Subject: [Buildroot] [PATCH 3/3] jq: switch to official tarball
In-Reply-To: <1385138401-26445-3-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 22 Nov 2013 13:40:01 -0300")
References: <1385138401-26445-1-git-send-email-gustavo@zacarias.com.ar>
 <1385138401-26445-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87siuom4cm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Ships configure thus fixing the breakage from the automake bump
 > to version 1.14 with AUTORECONF, with the added bonus of being faster.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/jq/jq.mk | 5 ++---
 >  1 file changed, 2 insertions(+), 3 deletions(-)

 > diff --git a/package/jq/jq.mk b/package/jq/jq.mk
 > index 8d4f24f..cc7c99e 100644
 > --- a/package/jq/jq.mk
 > +++ b/package/jq/jq.mk
 > @@ -4,9 +4,8 @@
 >  #
 >  ################################################################################
 
 > -JQ_VERSION = jq-1.3
 > -JQ_SITE = http://github.com/stedolan/jq/tarball/$(JQ_VERSION)
 > -JQ_AUTORECONF = YES
 > +JQ_VERSION = 1.3
 > +JQ_SITE = http://stedolan.github.io/jq/download/source

We have a problem here :/

The git tree tarball we used to download was also called jq-1.3.tar.gz,
so people who already downloaded it (and sources.buildroot.net) will NOT
redownload it, so the build will fail as there's no configure.

-- 
Bye, Peter Korsgaard
