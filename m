From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 00:23:26 +0200
Subject: [Buildroot] Using buildroot generated toolchain as external
 toolchain issues
In-Reply-To: <64CA5C49A43E314D9F7DAE05370E2F7B0677114D@hed-dc01.hed.local>
References: <64CA5C49A43E314D9F7DAE05370E2F7B06771147@hed-dc01.hed.local>
 <1526636.mbSdBIvjiD@sagittea>
 <20150729090036.65757161@free-electrons.com>
 <64CA5C49A43E314D9F7DAE05370E2F7B06771148@hed-dc01.hed.local>
 <20150729153034.514e8764@free-electrons.com>
 <64CA5C49A43E314D9F7DAE05370E2F7B0677114D@hed-dc01.hed.local>
Message-ID: <20150730002326.0c7d2843@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Starr,

On Wed, 29 Jul 2015 16:54:34 -0500, Matthew Starr wrote:

> output/host/opt/ext-toolchain/bin/../libexec/gcc/arm-buildroot-linux-gnueabihf/4.9.2/cc1: error while loading shared libraries: libcloog-isl.so.4: cannot open shared object file: No such file or directory
> Incorrect ABI setting: EABIhf selected, but toolchain is incompatible
> package/pkg-generic.mk:146: recipe for target 'output/build/toolchain-external-undefined/.stamp_configured' failed

That's because you have built gcc with graphite support, which requires
cloog. So either disable graphite support, or adjust cloog.mk to also
build the cloog library as a static library.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
