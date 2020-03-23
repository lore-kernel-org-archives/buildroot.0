From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 23 Mar 2020 18:50:27 +0000
Subject: [Buildroot] [Bug 12686] recipe for target 'install_dev' failed
 (libcrypto.so: file format not recognized)
In-Reply-To: <bug-12686-163@https.bugs.busybox.net/>
References: <bug-12686-163@https.bugs.busybox.net/>
Message-ID: <bug-12686-163-9dd76fMIbu@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12686

--- Comment #6 from Peter Seiderer <ps.report@gmx.net> ---
Two last (from my side) options/suggestions:

- maybe a parallel build issue, try to re-build libopenssl with BR2_JLEVEL=1
set in the .config file

- check your environment variables, your log excerpt shows something
with

    Makefile:358: recipe for target 'install_dev' failed

and 

    buildrootpath/host/bin/arm-buildroot-linux-gnueabihf-ar:
/buildrootpath/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libcrypto.so:
file format not recognized

In my Makefile (build/libopenssl-1.1.1d/Makefile) the target install_dev
is form line 310 to 355 and contains install/cp/$(RANLIB)/chmod/mv commands for
.new files....no 'ar' call...and RANLIB is specified as

   
RANLIB=$(CROSS_COMPILE)<my_working_dir>/host/bin/arm-buildroot-linux-gnueabihf-ranlib

-- 
You are receiving this mail because:
You are on the CC list for the bug.
