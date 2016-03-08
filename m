From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Mar 2016 12:36:35 +0100
Subject: [Buildroot] [Bug 8771] make savedefconfig modifies sources
In-Reply-To: <20160308090651.293fd95e@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 8 Mar 2016 09:06:51 +0100")
References: <bug-8771-163@https.bugs.busybox.net/>
 <bug-8771-163-YmX2Br27g5@https.bugs.busybox.net/>
 <56DE1142.6080201@mind.be>
 <20160308090651.293fd95e@free-electrons.com>
Message-ID: <87ziu942ws.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > To be honest, I don't see the difference between in-tree defconfigs,
 > and defconfigs in your BR2_EXTERNAL tree. In both cases, if
 > BR2_DEFCONFIG points to such defconfigs, when you run "make
 > savedefconfig", you will modify version-controlled source code, which
 > IMO isn't nice.

It is a tradeoff. When developing on a project using BR you want to keep
the config under configuration control, and you normally want to commit
minimal (savedefconfig) defconfigs, so making the steps needed to do so
as few as possible is imho a very nice thing.

If on the other hand you are just trying out stuff it doesn't make much
sense (but why are you running make savedefconfig in the first place
then?)

 > I simply believe that:

 >  - It deviates from what the kernel does, which is a bit in violation
 >    of our principle "our configuration system is like the kernel"

True.

 >  - It modifies version-controlled source code.

This can be seen both as a + and a -.

-- 
Bye, Peter Korsgaard
