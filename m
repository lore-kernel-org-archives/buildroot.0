From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Aug 2015 22:28:17 +0200
Subject: [Buildroot] [PATCH v1 0/2] Checking whether a certain CONFIG_*
	is set
In-Reply-To: <20150821132227.GA3753@free.fr> (Yann E. MORIN's message of "Fri, 
 21 Aug 2015 15:22:27 +0200")
References: <87lhd98twt.fsf@dell.be.48ers.dk>
 <1439990076-10412-1-git-send-email-viktorin@rehivetech.com>
 <20150819194643.1fad6062@free-electrons.com>
 <20150819190534.GA13372@free.fr> <87r3mz6lba.fsf@dell.be.48ers.dk>
 <20150821132227.GA3753@free.fr>
Message-ID: <877foo75em.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> > I think the plan I'll be goign with is to add a hidden Kconfig knob that
 >> > packages that want to build a kernel module will have to select.
 >> 
 >> Why not just like the kernel-module infrastructure handle it like I
 >> proposed? I don't think it is very nice that people have to remember to
 >> add the select as well (and chances are they won't notice if they
 >> forget).

 > Because that would not work for packages in br2-external trees, as I
 > already explained.

Are you sure? I didn't try it, but as we only *USE* the variable when
LINUX_KCONFIG_FIXUP_CMDS runs, which is after all the .mk files have
been parsed I think it should work?


> I know you are not using br2-external (and also do not really see the
 > point of it), but a lot of people find this to be a really important
 > feature. I also suspect some of our (corporate) users did choose
 > Buildroot (partly) because of br2-external.

It's true that I don't personally use br2-external and don't find it
such a killer feature, I *DO* acknowledge that some people do (which is
why I merged the support for it in the first place) and will try to keep
it working as good as possible. With that said, we have a lot of other
requirements for Buildroot (like keeping it simple), so will not bend
over backwards to improve br2-external support if it means making big
compromises elsewhere.

br2-external stuff will always been more limited than normal packages in
the tree.


 >> Like Thomas says, we are already doing the 2nd option and I think it
 >> makes sense to keep on doing so - So I don't think there's a common need
 >> for the first.

 > Still, we are currently not allowing another package to set kernel
 > options _from_ that package's .mk file. All we have is the kernel
 > (de)activating options based on the presence of other packages, and that
 > excludes packages from br2-external. Unless Buildroot is modified
 > accordingly (but then br2-external looses its attractiveness for that
 > package).

Ok, but if all of these use the kernel-module infrastructure (which
linux.mk knows about), then this should work for CONFIG_MODULES, right?
It naturally cannot work for random other config settings.

-- 
Venlig hilsen,
Peter Korsgaard 
