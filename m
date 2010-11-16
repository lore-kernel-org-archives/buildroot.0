From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 Nov 2010 16:59:14 +0000 (UTC)
Subject: [Buildroot] [Bug 2827] New: qt-4.7.0-pthread_getattr_np.patch
 invalid for qt 4.6.2, 4.6.3, 4.7.0, 4.7.1
Message-ID: <bug-2827-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2827

           Summary: qt-4.7.0-pthread_getattr_np.patch invalid for qt
                    4.6.2, 4.6.3, 4.7.0, 4.7.1
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: laborer2008 at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Subject.

In new Qt releases "pthread_getattr" used in two files, but patch fixed only
one:

sergey at host15:~/code/qt-everywhere-opensource-src-4.7.1/src$ grep -R
pthread_getattr_np *
3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp://
pthread_getattr_np or pthread_attr_getstack.
3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp:        //
LinuxBase is missing pthread_getattr_np - resolve it once at runtime instead
3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp:        static int
(*pthread_getattr_np_ptr)(pthread_t, pthread_attr_t *) = 0;
3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp:        if
(!pthread_getattr_np_ptr)
3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp:            *(void
**)&pthread_getattr_np_ptr = dlsym(RTLD_DEFAULT, "pthread_getattr_np");
3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp:        if
(pthread_getattr_np_ptr)
3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp:           
pthread_getattr_np_ptr(thread, &sattr);
3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp:       
pthread_getattr_np(thread, &sattr);
3rdparty/webkit/JavaScriptCore/runtime/Collector.cpp:       
pthread_getattr_np(thread, &sattr);

patch - from buildroot trunk at this time

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
