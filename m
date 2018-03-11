From: Laurent GONZALEZ <br22@gezedo.com>
Date: Sun, 11 Mar 2018 11:32:04 +0100
Subject: [Buildroot] binutils >=2.29 broken for existing thumb2 code
Message-ID: <d463d846-2545-4a6d-d6cf-8761adfdcc6c@gezedo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi list,

binutils 2.29 introduced a new behavior of pseudo assembly ARM instruction "adr". This broke a few existing software including linux kernel for cortex-M devices. I tumbled on these trying to rebuild stm32f4 config (I might propose to adopt them ;) )

Here are a some pertinent messages about this issue:
https://www.spinics.net/lists/arm-kernel/msg618268.html
https://www.spinics.net/lists/arm-kernel/msg618250.html

As far as I know, gnu as did not recover its legacy "adr" behavior, neither Linux has a patch to overcome the issue.

About buildroot, which will be preferable to fix the issue:
* have a temporary linux patch until it appears in the mainline
* force the use of pre-2.29 binutils
* something else

--
Laurent
