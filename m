From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 10 May 2019 07:29:22 +0000
Subject: [Buildroot] [Bug 11856] Busybox static build fails due to missing
 libtirpc
In-Reply-To: <bug-11856-163@https.bugs.busybox.net/>
References: <bug-11856-163@https.bugs.busybox.net/>
Message-ID: <bug-11856-163-qB9DOZ8lat@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11856

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This is not a bug. By default Buildroot has the option BR2_SHARED_LIBS=y, which
means "build only shared libraries, link everything dynamically".

If you set BR2_STATIC_LIBS=y instead, then only static libraries will be built,
and everything will be statically linked.

If you set BR2_SHARED_STATIC_LIBS=y, then both static and shared libraries will
be built (when possible: some sub-par build systems only allow building either
static or shared libs, not both), and programs will generally be linked
dynamically, unless their build system explicitly links statically.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
