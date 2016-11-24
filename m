From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 24 Nov 2016 16:23:46 +0000
Subject: [Buildroot] [PATCH next 4/6] moarvm: select libffi when
 building for MIPS
In-Reply-To: <20161124162121.7e15799e@free-electrons.com>
References: <20161123143914.3969-1-Vincent.Riera@imgtec.com>
 <20161123143914.3969-4-Vincent.Riera@imgtec.com>
 <20161123215657.5ac2436d@free-electrons.com>
 <179a55e6-44e2-f242-b803-03517419df25@imgtec.com>
 <20161124162121.7e15799e@free-electrons.com>
Message-ID: <1d433e42-c4e9-ca80-0fd3-8c6223e0d13b@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 24/11/16 15:21, Thomas Petazzoni wrote:
> Hello,
> 
> Thanks for your feedback.
> 
> On Thu, 24 Nov 2016 14:58:00 +0000, Vicente Olivert Riera wrote:
> 
>> MoarVM depends on libatomic_ops, and libatomic_ops doesn't have MIPS
>> support in Buildroot so far. This patch series adds MIPS support to it,
>> so, from that moment, MoarVM will be able to be built for MIPS.
> 
> If moarvm depends on libatomic_ops, then why the patch enabling MIPS
> support in libatomic_ops is PATCH 5/6, i.e. *after* the patch enabling
> moarvm? Won't things break if I apply only patches 1 to 4, but not
> patches 5 and 6 ?

no, there is no patch enabling or disabling MoarVM for MIPS. You won't
be able to build MoarVM for MIPS until libatomic_ops has support for
MIPS as well, because MoarVM depends on libatomic_ops.

So, if we enable libatomic_ops, then we will be able to build MoarVM,
and that will fail. What I did in my patch series is to add the code for
fixing the MIPS problem in MoarVM even before we can actually build it
for MIPS.

Regards,

Vincent

> 
> Best regards,
> 
> Thomas
> 
