From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 23:10:02 +0200
Subject: [Buildroot] [PATCH] autobuild-run: do not build evtest using
 extrenal arc-2014.12 toolchain
In-Reply-To: <1427190703-2935-1-git-send-email-abrodkin@synopsys.com>
References: <1427190703-2935-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150501231002.1bd0f207@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue, 24 Mar 2015 12:51:43 +0300, Alexey Brodkin wrote:
> This external arc-2014.12 toolchain has uClibc with disabled
> UCLIBC_HAS_PROGRAM_INVOCATION_NAME.
> 
> Because of this following build failure happens in autobuilder -
> http://autobuild.buildroot.net/results/0fd/0fd36a0d79c4d82aedebb5aca8d3ce4214b1ed61/
> --->8---
> evtest.c: In function 'version':
> evtest.c:730:20: error: 'program_invocation_short_name' undeclared (first use in this function)
>   printf("%s %s\n", program_invocation_short_name, PACKAGE_VERSION);
>                     ^
> evtest.c:730:20: note: each undeclared identifier is reported only once for each function it appears in
> evtest.c: In function 'usage':
> evtest.c:742:38: error: 'program_invocation_short_name' undeclared (first use in this function)
>   printf("   %s /dev/input/eventX\n", program_invocation_short_name);
> --->8---

I've marked this patch as Rejected, since I have committed another
patch to mark the Synopsys ARC external toolchain as "broken" because
the uClibc configuration is too far from the default Buildroot uClibc
configuration. We'll re-enable this toolchain once a new release is
made upstream, as we discussed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
