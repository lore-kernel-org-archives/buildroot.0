From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 24 Nov 2016 14:58:00 +0000
Subject: [Buildroot] [PATCH next 4/6] moarvm: select libffi when
 building for MIPS
In-Reply-To: <20161123215657.5ac2436d@free-electrons.com>
References: <20161123143914.3969-1-Vincent.Riera@imgtec.com>
 <20161123143914.3969-4-Vincent.Riera@imgtec.com>
 <20161123215657.5ac2436d@free-electrons.com>
Message-ID: <179a55e6-44e2-f242-b803-03517419df25@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 23/11/16 20:56, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 23 Nov 2016 14:39:12 +0000, Vicente Olivert Riera wrote:
>> Otherwise the compilation will fail like this:
>>
>> ./libmoar.so: undefined reference to `dcCallbackThunkEntry'
>>
>> See: https://github.com/MoarVM/MoarVM/issues/222
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> Is this something we can see in the autobuilders? I.e, is this master
> or next material?

Is next material since MoarVM is not available for MIPS, so you cannot
build it and you cannot hit that issue.
MoarVM depends on libatomic_ops, and libatomic_ops doesn't have MIPS
support in Buildroot so far. This patch series adds MIPS support to it,
so, from that moment, MoarVM will be able to be built for MIPS.

Regards,

Vincent

> 
> Thanks,
> 
> Thomas
> 
