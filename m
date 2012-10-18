From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Oct 2012 21:14:51 +0200
Subject: [Buildroot] Confused by the <fenv> implementation,
 causing gsl build issues
In-Reply-To: <13a751bd21c.19da.2760.rep.dot.nop@gmail.com>
References: <20121018154240.25b7a7e3@skate>
 <13a751bd21c.19da.2760.rep.dot.nop@gmail.com>
Message-ID: <20121018211451.3d1af865@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Thu, 18 Oct 2012 20:21:28 +0200, Bernhard Reutner-Fischer wrote:

> > Ok, but then why it can be selected on other architectures, and why
> > does it install <fenv.h> even on architectures where it is not
> > supported?
> 
> Please provide patches to add minimal fenv support for the target(s) 
> you are interested in.

Well, at this point I am not interested in any particular target. I am
interested in having uClibc building a correct toolchain, that doesn't
contain headers describing functions that it doesn't implement, causing
build issues in various userspace packages.

So I guess we should simply disable the possibility of enabling fenv
support on those architectures that don't have the necessary code.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
