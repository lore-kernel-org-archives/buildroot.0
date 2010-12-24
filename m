From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Dec 2010 08:52:46 +0100
Subject: [Buildroot] busybox, hardcoded config
In-Reply-To: <20101223073318.154656bz82tuap44@www.home.zuerker.org>
References: <20101223073318.154656bz82tuap44@www.home.zuerker.org>
Message-ID: <20101224085246.0a2d8640@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 23 Dec 2010 07:33:18 -0600
Heiko Zuerker <heiko@zuerker.org> wrote:

> there was recently a discussion on the topic of automatically turning  
> on specific kernel features, which can cause some problems.
> 
> This is very heavily done in busybox, i.e. nfs support for mount keeps  
> being turned on by the makefile. At least in my case this is causing  
> me some grief.

Could you detail why that specific behaviour on NFS is causing
problems ?

> I think we really should keep this automatically setting of  
> configurations to an absolute minimum. Can't we rely on the person  
> configuring buildroot, to set the correct options he or she needs for  
> example in busybox or the kernel?

There's no one-size-fits-all answer to this question. On the one hand,
we can't make everything automatic and we have to rely on the user to
make sane choices. On the other hand, we also want configurations built
by default to make sense as much as possible.

I'm not terribly happy about the BR2_PACKAGE_BUSYBOX_DONT_CHANGE_CONFIG
you proposed, but it's true I don't really have a better proposal.
Maybe we should automatically disable the automatic tuning if the
Busybox configuration file is not in package/busybox/ (i.e when it's a
non-Buildroot provided configuration file) ? But maybe this behaviour
is a bit tricky.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
