From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jun 2016 22:03:31 +0200
Subject: [Buildroot] [PATCH 2/2] gettext: install ABOUT-NLS for the host
In-Reply-To: <1466495278-30897-3-git-send-email-peter@korsgaard.com> (Peter
 Korsgaard's message of "Tue, 21 Jun 2016 09:47:58 +0200")
References: <1466495278-30897-1-git-send-email-peter@korsgaard.com>
 <1466495278-30897-3-git-send-email-peter@korsgaard.com>
Message-ID: <87bn2lkrn0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > gettextize copies a number of files from usr/share/gettext into the project
 > when it is run.  One of these is ABOUT-NLS, which is simply a text file
 > explaining some details about gettext - So it isn't really critical but
 > autoreconf fails if gettext functionality is used and ABOUT-NLS is missing.

 > Normally this isn't an issue as the release tarball typically already
 > contains an ABOUT-NLS file, but as this is a generated file it normally
 > isn't checked into git so it fails for packages from git snapshots using
 > <foo>_GETTEXTIZE = YES (E.G. libuio):

 > configure.ac:42: error: required file './ABOUT-NLS' not found

 > As is evident from GETTEXT_REMOVE_UNNEEDED, this file normally gets
 > installed by gettext-runtime, but as we don't build/install that for the
 > host instead install it by hand.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
