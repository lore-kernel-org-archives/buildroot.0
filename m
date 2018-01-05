From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Jan 2018 11:31:42 +0100
Subject: [Buildroot] [PATCH 1/2] nilfs-utils: need NPTL threads
In-Reply-To: <20180105101708.GF8058@airbook.vandijck-laurijssen.be>
References: <1515060652-22472-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <20180104101927.oexxtwusya3wppyk@tarshish>
 <20180104113336.6b7ed00a@windsurf.lan>
 <20180104105154.l24rvscxbsliquv3@tarshish>
 <20180104112815.GD18339@airbook.vandijck-laurijssen.be>
 <20180104155213.GC3684@scaer>
 <20180104172352.k6u2i3bkfmovgwgm@tarshish>
 <20180104201958.GB5130@waldemar-brodkorb.de>
 <20180105052334.mc3fabifliw7gzqn@tarshish>
 <20180105101708.GF8058@airbook.vandijck-laurijssen.be>
Message-ID: <20180105113142.47e4e087@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 5 Jan 2018 11:17:08 +0100, Kurt Van Dijck wrote:

> > The UCLIBC_HAS_ADVANCED_REALTIME help text says that this options enables 
> > clock_nanosleep(). But with current code you must have NPTL enabled for 
> > clock_nanosleep(). So the help text is not correct.
> > 
> > This also means that architectures lack NPTL support can't have 
> > clock_nanosleep() at all. Is there a reason for that?  
> 
> I share the concern, I appears that a shortcut has been taken in the
> uClibc configuration.
> 
> OTOH, the topic of this thread has drifted away.
> From the nilfs-utils point of view, depending on NPTL is necessary
> today, so the patch stands.
> I propose to start a different thread, and merge this patch for
> nilfs-utils. Doing so would fix the current build problems,
> and when the uclibc problem eventually resolves, nilfs-utils too will be
> patched to not depend on NPTL.
> 
> What do you think about that?

I agree. Especially since the same problem affects other packages, and
we have already added a NPTL dependency for those. When/if the uClibc
problem is fixed, we can get back to those packages and remove the NPTL
dependency if clock_nanosleep() becomes usable without NPTL.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
