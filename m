From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  2 Oct 2014 19:54:21 +0000 (UTC)
Subject: [Buildroot] [Bug 7478] Multiple chosen python modules are not built
 due to missing header files in include path
In-Reply-To: <bug-7478-163@https.bugs.busybox.net/>
References: <bug-7478-163@https.bugs.busybox.net/>
Message-ID: <20141002195421.22FA49D46F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7478

--- Comment #3 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-10-02 19:54:20 UTC ---
With this qemu-x86_64 defconfig :
BR2_x86_64=y
BR2_DL_DIR="~/repo/contrib/dl"
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.13.config"
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_SQLITE=y
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set

I see similar messages during the build:

Python build finished, but the necessary bits to build these modules were not
found:
_bsddb             _curses            _curses_panel   
_ssl               _tkinter           bsddb185        
bz2                dbm                dl              
gdbm               imageop            linuxaudiodev   
ossaudiodev        readline           sunaudiodev     
zlib

With this build (which is a slightly different config as the submitter showed)
sqlite3 can be imported correctly, but ssl cannot (_ssl not found, same thing
as reported).

So indeed, something seems incorrect here. 
I will try to investigate further.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
