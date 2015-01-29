From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Jan 2015 12:16:51 +0000 (UTC)
Subject: [Buildroot] [Bug 7844] Lua with hard-float on MIPS by buildroot
	doesn't work
In-Reply-To: <bug-7844-163@https.bugs.busybox.net/>
References: <bug-7844-163@https.bugs.busybox.net/>
Message-ID: <20150129121651.5F3D380431@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7844

--- Comment #6 from Vicente Olivert Riera <vincent.riera@imgtec.com> 2015-01-29 12:16:51 UTC ---
I have tested it on real MIPS hardware. I have built a Buildroot rootfs for
MIPS32 Little-Endian Hard-Float using the Sourcery CodeBench toolchain.

This is the defconfig I have used:

BR2_mipsel=y
# BR2_MIPS_SOFT_FLOAT is not set
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_SYSV=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
BR2_TARGET_GENERIC_ROOT_PASSWD="root"
BR2_PACKAGE_LUA=y

It works for me:

Welcome to Buildroot
buildroot login: root
Password: 
# cat > test.lua << EOF
> local var = 12345;
> print(var);
> EOF
# lua test.lua 
12345

What target device do you have? Can you share your defconfig with us? What
kernel are you using?

Thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
