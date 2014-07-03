From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Jul 2014 23:36:02 +0200
Subject: [Buildroot] [PATCH] freetype: fix double installation
In-Reply-To: <1404418764-3455-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 3 Jul 2014 22:19:24 +0200")
References: <1404418764-3455-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87oax66s71.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Eric_L on IRC reported that the following strange behavior: the first
 > installation of freetype works, and then each time you do "make
 > freetype-dirclean freetype", it fails and works alternatively, in a
 > fully reproducible manner.

[snip]

 > The proposed solution to solve this problem is to remove the symbolic
 > in a pre-install hook, run the installation, and restore the symbolic

s/in/link in/
 
 > -# Version 2.5.1 reorganized headers out of freetype2/freetype
 > -# It's unexpected for some packages so symlink it until it spreads upstream
 > +# Version 2.5.1 reorganized headers out of freetype2/freetype It's

A '.' and/or newline is missing before "It's".

Committed with these minor tweaks, thanks.

-- 
Bye, Peter Korsgaard
