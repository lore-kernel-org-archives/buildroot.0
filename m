From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Dec 2010 11:34:15 +0100
Subject: [Buildroot] Error linux compile time
In-Reply-To: <20101203101539.2975.qmail@f6mail-144-203.rediffmail.com>
References: <20101203101539.2975.qmail@f6mail-144-203.rediffmail.com>
Message-ID: <20101203113415.0315d0ad@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 3 Dec 2010 10:15:39 -0000
"Ravi" <phulsundar_ravi@rediffmail.com> wrote:

> echo "Welcome to Buildroot"
> &gt; /BACKUPS/Toolchain/buildroot-2010.08/output/target/etc/issue&gt;&gt;&gt;
> Configuring kernelcp
> "/BACKUPS/Toolchain/buildroot-2010.08/output/build/linux-2.6.34.1/" /BACKUPS/Toolchain/buildroot-2010.08/output/build/linux-2.6.34.1/.configcp:
> omitting directory
> `/BACKUPS/Toolchain/buildroot-2010.08/output/build/linux-2.6.34.1/'make:
> ***
> [/BACKUPS/Toolchain/buildroot-2010.08/output/build/linux-2.6.34.1/.stamp_configured]
> Error 1 ravi at localhost:/Toolchain/buildroot-2010.08$

It looks like you have set the BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
incorrectly. It should point to the kernel configuration you want to
use. Here it seems to point to the kernel build directory, which is
obviously incorrect.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
