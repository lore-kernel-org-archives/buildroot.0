From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Thu, 10 Jul 2008 00:37:28 -0700 (PDT)
Subject: [Buildroot]  Makefile.autotools.in problems
Message-ID: <18377517.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I have a problem with the Makefile.autotools.in when it does the patch
target.

The target creates a NAMEVER string (pkg_name-version).  It then checks to
see if it has any version specific files.  i.e pango-1.19.3.*.patch.
If it has is applies them and exits. (appies no generic patches)

The problem is that if I bounce the version to 1.22.0.  It does the check
and decides there are no version specific patches.  It then applies all
patches in the directory regardless.

This is only a problem as I have not deleted patches associated with an old
version.  
However I wanted to raise the issue in case it was originally planned that
you could have multiple patches in the directory for different versions and
it would apply only those patches that match.

Perhaps we could have a PKG_STRICT_PATCH variable.  That if set to true
would only apply patches that match the version string, if not set it would
apply all patches.

Any ideas, opinions?
Cheers
Dan


-- 
View this message in context: http://www.nabble.com/Makefile.autotools.in-problems-tp18377517p18377517.html
Sent from the BuildRoot mailing list archive at Nabble.com.
