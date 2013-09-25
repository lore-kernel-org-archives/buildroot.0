From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 25 Sep 2013 00:03:56 +0000 (UTC)
Subject: [Buildroot] [Bug 6500] New: php fails to build for armel.
Message-ID: <bug-6500-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6500

           Summary: php fails to build for armel.
           Product: buildroot
           Version: 2013.08
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: seetwobob at live.co.uk
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Unsure what other details may be helpful...


/home/me/GIT/buildroot-13-08/output/build/php-5.3.27/ext/fileinfo/libmagic/apprentice.c:
In function 'apprentice_load':
/home/me/GIT/buildroot-13-08/output/build/php-5.3.27/ext/fileinfo/libmagic/apprentice.c:781:4:
warning: passing argument 1 of '_php_stream_opendir' discards 'const' qualifier
from pointer target type [enabled by default]
In file included from
/home/me/GIT/buildroot-13-08/output/build/php-5.3.27/main/php.h:400:0,
                 from
/home/me/GIT/buildroot-13-08/output/build/php-5.3.27/ext/fileinfo/libmagic/apprentice.c:32:
/home/me/GIT/buildroot-13-08/output/build/php-5.3.27/main/php_streams.h:339:53:
note: expected 'char *' but argument is of type 'const char *'
make[1]: Leaving directory
`/home/me/GIT/buildroot-13-08/output/build/php-5.3.27'
make: *** [/home/me/GIT/buildroot-13-08/output/build/php-5.3.27/.stamp_built]
Error 2

Seems like a minor messup somewhere.
Upstream?  Unsure.  seems likely

Happy to provide more details upon request.
Hope this helps.

Will dig around for similar errors. I did find a bunch of pastebin logs of
fails that looked PRETTY similar but now obvious patches...

and a few similar reports of this error output laterally.
Just thought you should know.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
