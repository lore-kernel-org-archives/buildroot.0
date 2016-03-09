From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Mar 2016 15:05:15 +0100
Subject: [Buildroot] [PATCH] rtptools: disable for MIPS Codescape
 toolchains
In-Reply-To: <56E02C73.40105@imgtec.com>
References: <1457446983-17165-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160308163256.764be70e@free-electrons.com>
 <56DEF7EC.20904@imgtec.com>
 <20160308171149.7dff6ff4@free-electrons.com>
 <56E02C73.40105@imgtec.com>
Message-ID: <20160309150515.4cd8b894@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 9 Mar 2016 14:00:19 +0000, Vicente Olivert Riera wrote:

> the thing is that rtptools already includes its own ypclnt.h under the
> "nt/include/rpcsvc" directory, so we could replace the code you wrote
> above with something like this:
> 
> #ifndef __UCLIBC__
> #include "nt/include/rpcsvc/ypclnt.h"
> #endif
> 
> CC'ing Peter as he wrote the patch which adds that uClibc stuff to
> host2ip.c.

I haven't looked at the code, but it's not only about including a
header, Peter's patch also puts some code between HAVE_YP.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
