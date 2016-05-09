From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 May 2016 09:42:05 +0200
Subject: [Buildroot] [PATCH 01/34] reproducibility: introduce config knob
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 (Gilles Chanteperdrix's message of "Sat, 30 Apr 2016 09:48:57 +0200")
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <878tzjn0du.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org> writes:

 > Making the builds reproducible involves turning off build timestamps,
 > which some users may find annoying. So make the reproducible builds
 > optional.
 > ---
 >  Config.in | 3 +++
 >  1 file changed, 3 insertions(+)

 > diff --git a/Config.in b/Config.in
 > index d795361..3cdd659 100644
 > --- a/Config.in
 > +++ b/Config.in
 > @@ -623,6 +623,9 @@ config BR2_COMPILER_PARANOID_UNSAFE_PATH
 
 >  endmenu
 
 > +config BR2_REPRODUCIBLE
 > +	bool "Try and remove all sources of non-reproducibility from the build"
 > +

Hmm, I'm not sure I like the extra complexity of 2 ways of doing
things. What are the use cases for these timestamps? Are they important
enough to keep?

In any case, as enabling this option makes us do "more" (E.G. pass extra
arguments to tools), we should imho enable it by default to ensure those
code paths gets tested.

-- 
Bye, Peter Korsgaard
