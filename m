From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 24 Dec 2010 14:22:52 +0100
Subject: [Buildroot] busybox, hardcoded config
In-Reply-To: <20101223073318.154656bz82tuap44@www.home.zuerker.org> (Heiko
	Zuerker's message of "Thu, 23 Dec 2010 07:33:18 -0600")
References: <20101223073318.154656bz82tuap44@www.home.zuerker.org>
Message-ID: <87zkrvqp8z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Zuerker <heiko@zuerker.org> writes:

 Heiko> Hey,
 Heiko> there was recently a discussion on the topic of automatically turning
 Heiko> on specific kernel features, which can cause some problems.

 Heiko> This is very heavily done in busybox, i.e. nfs support for mount keeps
 Heiko> being turned on by the makefile. At least in my case this is causing
 Heiko> me some grief.

Hmm, why is that? Presumably you want to be able to mount NFS shares if
you enable RPC support in the toolchain?

We could remove the enable part of the NFS setting though (so only
disable if no RPC support to not get a build error), and just enable it
in the default config.

 Heiko> I think we really should keep this automatically setting of
 Heiko> configurations to an absolute minimum. Can't we rely on the person
 Heiko> configuring buildroot, to set the correct options he or she needs for
 Heiko> example in busybox or the kernel?

Agreed. We shouldn't tweak configs behind the users back more than
absolutely necessary. Busybox is a bit special in the sense that we want
to use a single default config, but some options depends on how the
toolchain is configured.

-- 
Bye, Peter Korsgaard
