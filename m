From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 25 Sep 2007 11:30:23 +0200
Subject: [Buildroot] svn commit: trunk/buildroot: package
	package/busyboxproject target etc...
References: <20070925075548.85ACD30044@busybox.net>
Message-ID: <01bd01c7ff59$2b8ea790$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: <aldot@uclibc.org>
To: <buildroot@uclibc.org>
Sent: Tuesday, September 25, 2007 9:55 AM
Subject: [Buildroot] svn commit: trunk/buildroot: package package/busyboxproject target etc...


> Author: aldot
> Date: 2007-09-25 00:55:45 -0700 (Tue, 25 Sep 2007)
> New Revision: 20001
> 
> Log:
> - revert patch that obfuscates the config UI and doesn't reflect the order of config steps
> 
> 
> Modified:
>   trunk/buildroot/Config.in
>   trunk/buildroot/package/Config.in
>   trunk/buildroot/package/busybox/Config.in
>   trunk/buildroot/project/Config.in
>   trunk/buildroot/target/Config.in
>   trunk/buildroot/target/device/Config.in
>   trunk/buildroot/target/device/Target.in
>   trunk/buildroot/toolchain/Config.in.2
>   trunk/buildroot/toolchain/gcc/Config.in
>   trunk/buildroot/toolchain/kernel-headers/Config.in
> 
> 
> Changeset:
> 

I do think that the order of configuration is important for chip /board selection
and that is why it is the first choice.
I also think it is good that it becomes more obvious which boards
you can select in the *same* menu as where you select the chip, chip-variant, board.

For the rest, the intention is to make the configuration more user-friendly.
This means lower priority to configuration which is done *once*,
like build and toolchain parameters.

If you work with buildroot, then you are going to change packages most often
and therefore, they deserve to be close to the top.

Best Regards
Ulf Samuelsson
