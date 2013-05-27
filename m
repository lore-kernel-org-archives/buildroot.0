From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 May 2013 21:12:00 +0200
Subject: [Buildroot] Design issue with the out-of-tree support
In-Reply-To: <51A38EEE.7000406@mind.be>
References: <20130523131251.2ffc509f@skate>
	<51A38EEE.7000406@mind.be>
Message-ID: <20130527211200.735491c7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Mon, 27 May 2013 18:50:54 +0200, Arnout Vandecappelle wrote:

>   I haven't read the thread in detail or thought about it very carefully, 
> but some time ago I already thought that this would be better.
> 
>   It is not necessarily limited to autoreconf. For example, the way that 
> xenomai patches the linux sources fits in this as well (xenomai could add 
> to LINUX_POST_AUTORECONF_HOOKS).
> 
>   So I would propose to add another step to the generic infrastructure. I 
> would call it the PREPARE step, and make it a full step with CMDS and HOOKS.

Indeed. For now, it's only has a CMDS and no HOOKS, but it could be
added later on.

>   The question is whether the OVERRIDE_SRCDIR infrastructure should apply 
> this step or not. Conceptually, it shouldn't, but that means that users 
> of OVERRIDE_SRCDIR for packages that need an autoreconf would need to do 
> the autoreconf manually. Which is probably for the best anyway, but which 
> is a change compared to current behaviour.

For now, I consider doing the prepare step even on OVERRIDE_SRCDIR
package, even if that means that we are modifying the source directory.

>   BTW the libtool fixup should probably be done in this prepare step as 
> well. But again, I haven't thought this through in detail.

This is already done:

 http://git.free-electrons.com/users/thomas-petazzoni/buildroot/commit/?h=out-of-tree-v3&id=5cf6166d713a43cdf83cdf794502eb77be36d43f

Thanks for the feedback!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
