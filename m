From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 24 Sep 2011 09:24:27 +0000 (UTC)
Subject: [Buildroot] [Bug 4219] can't complie microperl with error undefined
 reference to `__ctype_b'
In-Reply-To: <bug-4219-163@https.bugs.busybox.net/>
References: <bug-4219-163@https.bugs.busybox.net/>
Message-ID: <20110924092427.9CAA98C9CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4219

??? <xiaxiaojin@safefw.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID

--- Comment #4 from ??? <xiaxiaojin@safefw.com>  ---
I checked uclibc.config contains UCLIBC_HAS_CTYPE_TABLES.
I tried many times, compiling microperl success, here is my compilation steps:
1. Chmod + w Makefile.micro

2 In line 39, as described below, the last uudmap.h bitcount.h removed.
        38 clean:
      39-rm-f $ (O) microperl generate_uudmap $ (_X)
      40 #-rm-f $ (O) microperl generate_uudmap $ (_X) uudmap.h bitcount.h

3. First in the x86 compiler normally generates two files uudmap.h bitcount.h
   root [perl-5.14.0] # make-f Makefile.micro

4 comments Dir 181,182 lines
     181 # uudmap.h bitcount.h: generate_uudmap $ (_X)
     182 # $ (RUN). / Generate_uudmap $ (_X) uudmap.h bitcount.h

5 Executive root [perl-5.14.0] # make-f Makefile.micro clean
    Then uudmap.h bitcount.h not delete the two files. uclibc compile perl will
be used.

6 Finally compile uclibc microperl
   root [perl-5.14.0] # make-f Makefile.micro CC = i686-linux-gcc

Thank you for your help.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
