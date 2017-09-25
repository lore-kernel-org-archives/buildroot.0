From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 Sep 2017 12:49:26 +0000
Subject: [Buildroot] [Bug 10326] New: mesa3d package fails to build when
 BR2_SHARED_STATIC_LIBS=y
Message-ID: <bug-10326-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10326

            Bug ID: 10326
           Summary: mesa3d package fails to build when
                    BR2_SHARED_STATIC_LIBS=y
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: frederic.mathieu at dualis.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7236
  --> https://bugs.busybox.net/attachment.cgi?id=7236&action=edit
compilation log

Hi

with BR2_SHARED_STATIC_LIBS=y, mesa3d package compilation exits with error 2.
the compilation is successfully completed if I add the following lines to
makefile (package/mesa3d/mesa3d.mk) : 

ifeq ($(BR2_SHARED_STATIC_LIBS),y)
MESA3D_CONF_OPTS += --disable-static
endif

bug found on versions 2017.08, 2017.05.x

regards
Fredric MATHIEU

-- 
You are receiving this mail because:
You are on the CC list for the bug.
