From: =?gb2312?B?s8LQobjV?= <shawn_chen@realsil.com.cn>
Date: Thu, 19 Jul 2018 09:10:03 +0000
Subject: [Buildroot] patch: fix wrong sysroot path when given rsdk toolchain
Message-ID: <14A4BC6FC7AB3340A49D24D6ACB7BED930620C@RS-MBS02.realsil.com.cn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The attachment is a patch that fixes a Realtek toolchain that has a sysroot path of ?mips-linux-uclibc?, this causes the buildroot recognizes the sysroot as ?mips-linux-uc? by the sed operation, and then the external toolchain setup is failed. Adding a ?/? in the sed re expression avoids the wrong substitution, other toolchains like linaro arm toolchain are tested ok to ensure no side effect is induced, please help review and apply this patch, thanks.

Regards
Shawn Chen
Realtek Semiconductor

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180719/5b0e5652/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-fix-wrong-sysroot-path-when-given-rsdk-toolchain.patch
Type: application/octet-stream
Size: 1129 bytes
Desc: 0001-fix-wrong-sysroot-path-when-given-rsdk-toolchain.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180719/5b0e5652/attachment.obj>
