From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 5 Dec 2011 12:23:42 +0100
Subject: [Buildroot] kernel-headers and external toolchain
Message-ID: <201112051223.43094.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hoi all,

 [Please keep me in CC]

 I have a configuration with an external toolchain and a custom (git) kernel.  This custom kernel exports some custom headers (with extra v4l2 ioctls).  However, these don't get copied into staging.  Indeed, the kernel-headers target is only included when the internal uClibc toolchain is used.

 I have two possible solutions for this.

1. When compiling a kernel, install its headers into staging.  This overrides the headers that are included in an external or ct-ng toolchain, which is risky.  However, the kernel headers are considered ABI and Linus makes an effort to keep ABI compatibility, so the risk is limited.

2. When compiling the package that relies on these custom headers, add a 
-I$(LINUX_DIR)/include to CFLAGS.  I feel uncomfortable to rely on the presence of the source directory like that.  OTOH, for LINUX_DIR this is anyway unavoidable to compile external modules.


 Which solution do the others prefer?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
