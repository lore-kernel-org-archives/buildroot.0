From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 23 Aug 2020 22:09:26 +0000
Subject: [Buildroot] [Bug 13141] Target-finalize fail with "depmod: ERROR:
 Bad version passed"
In-Reply-To: <bug-13141-163@https.bugs.busybox.net/>
References: <bug-13141-163@https.bugs.busybox.net/>
Message-ID: <bug-13141-163-JcXxw7qgwJ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13141

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Laurent, All,

Thanks for the report.

Could you try a few things for me, please:
 1- run:  make V=1
 2- in the LINUX_RUN_DEPMOD macro, add this as the first command:
        printf '"%s"\n' "$(LINUX_VERSION_PROBED)"
 3- try a build without ccache

Also, I noticed something weird in your report:


--> My manual commands (that succeed):
#/usr/bin/make  HOSTCC="/home/buildroot/output/host/bin/ccache /usr/bin/gcc -O2
-I/home/buildroot/output/host/include -L/home/buildroot/output/host/lib
-Wl,-rpath,/home/buildroot/output/host/lib" ARCH=arm
INSTALL_MOD_PATH=/home/buildroot/output/target
CROSS_COMPILE="/home/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-"
DEPMOD=/home/buildroot/output/host/sbin/depmod INSTALL_MOD_STRIP=1 -C
/home/buildroot/output/build/linux-linux4sam_6.2 --no-print-directory -s
kernelrelease 2>/dev/null

4.19.78-linux4sam-6.2


There is an empty line between the command and the version string. Is it
really what happens, or is it an artefact of your copy-paste?

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
