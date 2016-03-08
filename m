From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 09:06:51 +0100
Subject: [Buildroot] [Bug 8771] make savedefconfig modifies sources
In-Reply-To: <56DE1142.6080201@mind.be>
References: <bug-8771-163@https.bugs.busybox.net/>
 <bug-8771-163-YmX2Br27g5@https.bugs.busybox.net/>
 <56DE1142.6080201@mind.be>
Message-ID: <20160308090651.293fd95e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, 8 Mar 2016 00:39:46 +0100, Arnout Vandecappelle wrote:

>   I think we do agree that it is weird for the in-tree defconfigs. In the past, 
> there was no way to distinguish between the upstream in-tree defconfigs, and the 
> defconfigs that you add to your custom buildroot tree for internal use. But now 
> we could say that you're supposed to use BR2_EXTERNAL, So we could reset 
> BR2_DEFCONFIG for in-tree configs.

To be honest, I don't see the difference between in-tree defconfigs,
and defconfigs in your BR2_EXTERNAL tree. In both cases, if
BR2_DEFCONFIG points to such defconfigs, when you run "make
savedefconfig", you will modify version-controlled source code, which
IMO isn't nice.

But again, this is really a matter of taste, and I did understand the
idea of having make savedefconfig "automagically" save back to the
defconfig the configuration was started from.

I simply believe that:

 - It deviates from what the kernel does, which is a bit in violation
   of our principle "our configuration system is like the kernel"

 - It modifies version-controlled source code.

>   Of course, at the moment we still point to the in-tree 
> configs/<boardname>_defconfig in the manual, so that would have to change first...

I'm not sure what you mean by "we still point to". In which place of
the manual?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
