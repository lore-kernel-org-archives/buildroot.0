From: ing. Federico Fuga <fuga@studiofuga.com>
Date: Fri, 9 Mar 2007 12:46:16 +0100
Subject: [Buildroot] modutils and kernel 2.6.33 - Unresolved symbols
Message-ID: <20070309124616.584f6fb7@lama.infinity.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have some trouble while creating an installation with the kernel
2.4.33 + RTAI patches 3.4
The kernel is woking good but I cannot load any module.
The error reported by modutils is some unresolved symbols, printk and
kalloc for example. the CONFIG_MODVERSIONS option is not an issue - the
problem is present with and without that option - remark that I always
rebuild the entire kernel tree and modules so there is not any mismatch
between the modversions.
I noticed that

- sometimes the kernel i built with the modversions
incerrectly, that means that  /proc/ksyms  reports for example
printk__ver_prink instead of printk_R_xxxxx . it seems a compilation
error.

- it seems that modutils cannot resolve the symbols, because if depmod
or insmod reports printk not present, I can see that /proc/ksyms haves
printk -- without the modversions, for example.

- ksyms -a reports nothing

Anyone experienced something like this?

Thank you in advance! 
Regards

ing. Federico Fuga
