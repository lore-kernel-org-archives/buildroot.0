From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 May 2018 15:14:10 +0200
Subject: [Buildroot] [PATCH v3] pkg-generic: error out with 'local' site
 method and no _SITE
In-Reply-To: <20180523090108.16009-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Wed, 23 May 2018 11:01:08 +0200")
References: <20180523090108.16009-1-arnout@mind.be>
Message-ID: <87in79gs0t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > The 'local' site method is easily confused with the 'file' site method,
 > making people create packages like this:

 >     FOO_SITE_METHOD = local
 >     FOO_SOURCE = foo.tar.gz

 >     $(eval $(generic-package))

 > Due to the intricacies of the generic package infra, this does not
 > cause an error; instead, the foo.tar.gz tarball that happens to be
 > present in the download directory will be used. This behaviour differs
 > greatly from what is specified in the manual.

 > Instead, error out immediately if a package specifies the 'local' site
 > method but does not specify a _SITE.

 > We check for _OVERRIDE_SRCDIR rather than checking for _SITE, just
 > after _OVERRIDE_SRCDIR has been set to _SITE. Indeed, a package that
 > sets _OVERRIDE_SRCDIR but not _SITE currently works correctly. There is
 > no reason to make it fail.

 > See also
 > https://stackoverflow.com/questions/50364655/including-patches-to-build-root

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 > v3: error about _SITE, not about _SITE_METHOD (Thomas)
 > v2: explain in commit message why we check for _OVERRIDE_SRCDIR

Committed, thanks.

-- 
Bye, Peter Korsgaard
