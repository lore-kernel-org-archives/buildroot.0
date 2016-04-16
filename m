From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Apr 2016 09:31:33 +0200
Subject: [Buildroot] [PATCH v4 3/3] dpdk: new package
In-Reply-To: <20160416020708.03ce1bf3@jvn>
References: <1459042284-6684-1-git-send-email-viktorin@rehivetech.com>
 <1459042284-6684-4-git-send-email-viktorin@rehivetech.com>
 <20160415235203.3f9ed61e@free-electrons.com>
 <20160416020708.03ce1bf3@jvn>
Message-ID: <20160416093133.1be7c7b8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Apr 2016 02:07:08 +0200, Jan Viktorin wrote:

> > I have enabled PCI_MSI=y and UIO=y in my kernel configuration, and
> > still, I don't have any .ko file installed in my target. Is this
> > expected?
> 
> Of course, you are right. They are built but not installed. Fixed.

Good, thanks!

> > When the architecture is ARMv7, please pass:
> > 
> > 	CPU_FLAGS=
> > 
> > Otherwise, the dpdk build system passes -mfloat-abi=softfp, which makes
> > the build fail when the selected ABI is EABIhf. And please report the
> > bug upstream: the dpdk build system should not make assumptions on the
> > selected ARM ABI.
> 
> Well, this leads to some hardcoded check of architecture into the
> dpdk.mk. I don't like such approach.

Well, I don't see what's the problem with that really, but...

> Would you instead accept the
> following (temporary) patch into Buildroot as a solution for this?
> 
> http://dpdk.org/ml/archives/dev/2016-April/037577.html

... if such a patch gets accepted upstream, then I'm fine with carrying
the patch in Buildroot in the mean time.

> > Can you fix those issues and resend?
> 
> Sure, I will resend after I solve the ARM ABI issue.

Well, you solved it it seems, right? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
