From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 May 2013 14:41:28 +0200
Subject: [Buildroot] [PATCH] poco: not available for all architectures
In-Reply-To: <5194D04F.7050406@zacarias.com.ar>
References: <1368704401-1832-1-git-send-email-gustavo@zacarias.com.ar>
 <20130516115453.GF4709@tarshish> <5194CAB9.8020102@zacarias.com.ar>
 <20130516142325.5afc5306@skate> <5194D04F.7050406@zacarias.com.ar>
Message-ID: <20130516144128.6735cb45@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 16 May 2013 09:25:51 -0300, Gustavo Zacarias wrote:
> On 05/16/2013 09:23 AM, Thomas Petazzoni wrote:
> 
> >> I'm actually disabling the comment if it's not a supported architecture
> >> with that line (same as the option itself).
> > 
> > I believe that what Baruch says is that the comment is useless when
> > you're on an architecture that poco doesn't support.
> > 
> > So it should actually be:
> > 
> > 	depends on (BR2_aarch64 || BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel || BR2_xtensa)
> > 
> > No?
> 
> Maybe it's because i'm out of coffee, but i don't see that holding.
> So comment "hey you lack toolchain X" when ARCH = aarch64 || arc .. ?
> So it shows up if any of those arches == true ?

Doh, I must be the one needing more coffee it seems. Yeah, if the
package is not available on some arches, we need to do "depends
on !(some arches)" on both the package itself and the comment, which is
what you did.

Got confused, sorry.

Confusingly-acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
