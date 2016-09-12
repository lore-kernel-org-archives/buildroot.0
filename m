From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Sep 2016 20:20:07 +0000
Subject: [Buildroot] [Bug 8946] Valgrind fails to build with stack
	protection turned on
In-Reply-To: <bug-8946-163@https.bugs.busybox.net/>
References: <bug-8946-163@https.bugs.busybox.net/>
Message-ID: <bug-8946-163-NDuKBXLJJx@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8946

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #7 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
The following configuration (reduced from your defconfig, and changed to use a
toolchain with SSP enabled) builds just fine here:

BR2_arm=y
BR2_cortex_a9=y
BR2_SHARED_STATIC_LIBS=y
BR2_TOOLCHAIN_BUILDROOT_USE_SSP=y
BR2_ENABLE_LOCALE_PURGE=y
BR2_PACKAGE_VALGRIND=y
BR2_PACKAGE_VALGRIND_SGCHECK=y
BR2_PACKAGE_VALGRIND_BBV=y
BR2_PACKAGE_VALGRIND_LACKEY=y
BR2_PACKAGE_VALGRIND_NULGRIND=y

I tested wiht 2016.05-rc1, which is the version you used according to your
configuration file.

Can you retest with 2016.08, and provide a minimal Buildroot configuration that
exhibits the problem?

Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
