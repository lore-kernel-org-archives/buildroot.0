From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 24 Mar 2020 10:13:17 +0000
Subject: [Buildroot] [Bug 12686] recipe for target 'install_dev' failed
 (libcrypto.so: file format not recognized)
In-Reply-To: <bug-12686-163@https.bugs.busybox.net/>
References: <bug-12686-163@https.bugs.busybox.net/>
Message-ID: <bug-12686-163-nVRQf8eC4v@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12686

--- Comment #7 from Juan <jrmcorreo-linux@yahoo.es> ---
Hi again,

I tried changing value for the variable BR2_JLEVEL from 0 to 1 with no success.
About Makefile, the 358 line is next one:

357: install_dev: install_runtime_libs
358:    @[ -n "$(INSTALLTOP)" ] || (echo INSTALLTOP should not be empty; exit
1)
359:    @$(ECHO) "*** Installing development files"
360:    @$(PERL) $(SRCDIR)/util/mkdir-p.pl
$(DESTDIR)$(INSTALLTOP)/include/openssl
361:    @ : 

If you want I can attach the whole Makefile (1.2 MB), but my point is that only
will serve to waste disk space on server.

About environment variables, I see no other value related to building
environment except PATH including entry to perl5, also PERL_LOCAL_LIB_ROOT and
PERL_LOCAL_LIB_ROOT entries.


Thank you and best regards

-- 
You are receiving this mail because:
You are on the CC list for the bug.
