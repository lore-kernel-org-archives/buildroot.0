From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 21 Jan 2016 00:52:35 +0000
Subject: [Buildroot] [Bug 8621] New: sqlite package, properly enable readline
Message-ID: <bug-8621-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8621

            Bug ID: 8621
           Summary: sqlite package, properly enable readline
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: lonnie at abelbeck.com
                CC: buildroot at uclibc.org

Properly enable readline, as below:


  ifeq ($(BR2_PACKAGE_SQLITE_READLINE),y)
  SQLITE_DEPENDENCIES += ncurses readline
- SQLITE_CONF_OPTS += --with-readline-inc="-I$(STAGING_DIR)/usr/include"
+ SQLITE_CONF_OPTS += --enable-readline
  else
  SQLITE_CONF_OPTS += --disable-readline
  endif

-- 
You are receiving this mail because:
You are on the CC list for the bug.
