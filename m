From: James Newell <jnewell@wgate.com>
Date: Thu, 08 Feb 2007 20:41:53 -0500
Subject: [Buildroot] building ARM toolchain with nofpu
In-Reply-To: <200702072136.41131.yann.morin.1998@anciens.enib.fr>
References: <c88e466f0701311609u4896b81ehb99cb2eb01f78886@mail.gmail.com>
	<1170878990.10007.4.camel@ndragon.eng.wgate.com>
	<200702072124.30009.yann.morin.1998@anciens.enib.fr>
	<200702072136.41131.yann.morin.1998@anciens.enib.fr>
Message-ID: <1170985313.3423.1.camel@ndragon.eng.wgate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The buildroot only seems to go to gcc 4.0.3? 

On Wed, 2007-02-07 at 21:36 +0100, Yann E. MORIN wrote:
> On Wednesday 07 February 2007 212, Yann E. MORIN wrote:
> > Short answer: it does not work.
> > See: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=29329  [1]
> > (not directly related, but yet, useless on ARM).
> 
> I realise I'm being vague. Some explanations below.
> 
> In fact, the patch I posted allows one to successfully build a x-compiler
> for soft-float armeb (mine is armeb-xscale-linux-uclibc, tuned for Xscale).
> Unfortunately, the resulting gcc barfs on the squashfs code in the kernel.
> A smaller test-case is available in the bug report, suggesting this is quite
> easy to hit.
> 
> That's why I've reverted to gcc-4.0.4, which still needs the attached patch,
> but Just Work (TM).
> 
> Regards,
> Yann E. MORIN.
> 
