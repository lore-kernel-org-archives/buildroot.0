From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  4 Mar 2009 16:48:56 +0000 (UTC)
Subject: [Buildroot] [Bug 143] New: Convert php package to
 Makefile.autotools.in and a ton of other improvements
Message-ID: <bug-143-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=143

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Convert php package to Makefile.autotools.in and a ton
                    of other improvements
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=103)
 --> (https://bugs.busybox.net/attachment.cgi?id=103)
Convert php to Makefile.autotools.in and other improvements

This patch is a biggie:

* Migrate php package to Makefile.autotools.in

* Make PCRE regex an option (previously forced on)

* Add calendar option from bug #77

* Add external sqlite3 option from bug #141
New option BR2_PACKAGE_PHP_PDO_SQLITE_EXTERNAL

* Add alternate php.ini configuration option from bug #5
Named BR2_PACKAGE_PHP_CONFIG and defaults to shipped config.
In most scenarios the shipped config isn't good enough, it has a high memory
limit for embedded for example.

* Changed some options from depends to select
Namely openssl, libxml2, zlib, gettext, gmp.

* Disabled some 'y' defaults to make things lighter by default
Namely libxml2, sqlite, pdo and pdo_sqlite.

* Made some of the extensions help text more verbose

Remember this one obsoletes my previous bugs #5, #77 and #141.
Hope i'm not stepping into someone's toes...


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
