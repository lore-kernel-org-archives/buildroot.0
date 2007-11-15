From: Michael Trimarchi <trimarchimichael@yahoo.it>
Date: Thu, 15 Nov 2007 14:09:13 +0000 (GMT)
Subject: [Buildroot] Illegal Instruction in arm buildroot
Message-ID: <203109.65849.qm@web26215.mail.ukl.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

>I have searched the config files for soft_float  options, but the only
>section that provides that is on the external_toolchain

>happycactus at cammello:~/buildroot> grep SOFT_FLOAT */*/Config.in
>toolchain/external-toolchain/Config.in:config BR2_SOFT_FLOAT

double a;
...
a = 1.40;
a = a / 23;

If the cpu doesn't provide an fpu unit, you must add the soft float emulation
in your kernel config e/o in your toolchain.

Kernel just resolve the illegal instruction using a soft float unit.

Regards michael






      ___________________________________ 
L'email della prossima generazione? Puoi averla con la nuova Yahoo! Mail: http://it.docs.yahoo.com/nowyoucan.html
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071115/c2b9b0f2/attachment.htm 
