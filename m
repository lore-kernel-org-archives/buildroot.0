From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 10 Dec 2011 15:45:35 +0000 (UTC)
Subject: [Buildroot] [Bug 4592] New: libXfont and libXft building failed,
 cross-compilation error
Message-ID: <bug-4592-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4592

           Summary: libXfont and libXft building failed, cross-compilation
                    error
           Product: buildroot
           Version: 2011.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: marioabajo at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi :)
 I was  getting this type of errors when building an arm images with Xorg:


  CC     xftswap.lo
  CC     xftxlfd.lo
  CCLD   libXft.la
/usr/lib/libfreetype.so: file not recognized: File format not recognized
collect2: ld returned 1 exit status
make[3]: *** [libXft.la] Error 1

I was able to correct the problem adding this line to the package definition
file xlib_libXfont.mk:
XLIB_LIBXFONT_CONF_ENV = FREETYPE_LIBS=$(STAGING_DIR)/usr/lib

and also to xlib_libXft.mk:
XLIB_LIBXFT_CONF_ENV = FREETYPE_LIBS=$(STAGING_DIR)/usr/lib


Thanks a lot for this great piece of software.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
