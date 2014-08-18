From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Aug 2014 10:37:16 +0200
Subject: [Buildroot] [PATCHv4 0/3] gettext changes to solve bug #7124
In-Reply-To: <1408196842-16740-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 16 Aug 2014 15:47:19 +0200")
References: <1408196842-16740-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87fvguw5vn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > Here is a fourth version of the gettext changes, that include fixes
 > for the additional comments made by Thomas DS on the manual (PATCH
 > 3/3).

 > Since they actually fix a runtime issue with ecryptfs-utils, reported
 > as bug #7124, I'd like them to be considered for 2014.08.

 > Basically, the core of the issue is that the numerous ecryptfs-utils
 > shell scripts use the "gettext" program on the target to query
 > translated strings. However, with glibc toolchains, we do not allow
 > the selection of the gettext package, because the gettext *functions*
 > are already part of the C library.

 > However, this totally overlooks the fact that gettext provides more
 > than a library, it also provides utilities, which in the case of
 > ecryptfs-utils, are needed on the target.

 > Moreover, the gettext configure script is smart enough to *not*
 > generate libintl.so when the C library already has the gettext
 > function. It therefore has the right behavior depending on the C
 > library: for glibc, only the gettext "utilities" are installed, for
 > uClibc, both libintl and the gettext utilities are installed.

 > These three patches are just a new version rebased on top of master,
 > and re-tested.

 > Long term, maybe we should rename BR2_NEEDS_GETTEXT and
 > BR2_NEEDS_GETTEXT_IF_LOCALE to BR2_NEEDS_LIBINTL and
 > BR2_NEEDS_LIBINTL_IF_LOCALE, because this is really what those config
 > knobs mean.

 > Thanks,

 > Thomas

 > Thomas Petazzoni (3):
 >   gettext: allow building when BR2_NEEDS_GETTEXT is not selected
 >   ecryptfs-utils: select gettext, needed for command line utilities
 >   docs/manual: update documentation about gettext handling

Committed series, thanks.

-- 
Bye, Peter Korsgaard
