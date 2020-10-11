From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Oct 2020 19:05:40 +0200
Subject: [Buildroot] Issue Building gdbserver in Buildroot 2019.02.7
In-Reply-To: <DM6PR12MB41534F87E9A4D9CCED3057B1AA080@DM6PR12MB4153.namprd12.prod.outlook.com>
 (Sam Tennent's message of "Fri, 9 Oct 2020 15:58:19 +0000")
References: <DM6PR12MB41534F87E9A4D9CCED3057B1AA080@DM6PR12MB4153.namprd12.prod.outlook.com>
Message-ID: <87v9fgvgkb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sam" == Sam Tennent <Sam.Tennent@synopsys.com> writes:

 > Hi Folks,
 > I'm seeing an issue when trying to build gdbserver for our ARMv8 based Virtual Prototype.

 > I can do this successfully for an older revision of Buildroot (
 > 2018.02.1) but for 2019.02.7 I can't get it to build.

2019.02.x is EOL, could you give 2020.02.6, 2020.08 or current master a
try?

A quick test on current master works here (external toolchain for
speed):

cat defconfig
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_GDB=y

ls -lah target/usr/bin/gdbserver
-rwxr-xr-x 1 peko peko 507K Oct 11 19:04 target/usr/bin/gdbserver

 > I realize that these builds a quite different since they are before
 > and after gdbserver switched from a C app to C++ but I think I have
 > taken this into account in my defconfig.

 > Here's my defconfig

 > BR2_aarch64=y
 > BR2_GLOBAL_PATCH_DIR="$(TOPDIR)/../input/patches/"

Are you patching anything in the toolchain?

-- 
Bye, Peter Korsgaard
