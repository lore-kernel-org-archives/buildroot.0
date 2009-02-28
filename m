From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 28 Feb 2009 09:55:54 +0100
Subject: [Buildroot] buildbot infrastructure
In-Reply-To: <734988.78183.qm@web56907.mail.re3.yahoo.com> (Frank Hoeflich's
	message of "Fri\, 27 Feb 2009 15\:44\:45 -0800 \(PST\)")
References: <734988.78183.qm@web56907.mail.re3.yahoo.com>
Message-ID: <8763ivkkit.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hoeflich <frankhoeflich@yahoo.com> writes:

Hi,

 Frank> I tried to look into this and couldn't find anything for
 Frank> buildbot in my copy of the tree.  Is it available for
 Frank> developers to inspect?

We don't have anything in the tree, but setting up buildbot is quite
easy. I have it running at work for the targets we're using.

Building is just a matter of:

svn update
yes ''|make <target>_defconfig
yes ''|make

Or in buildbot syntax:

    f1 = factory.BuildFactory()
    f1.addStep(SVN(svnurl=SVNURL, mode="copy"))
    f1.addStep(Configure(command="yes ''|make "+target + "_defconfig"))
    f1.addStep(Compile(command="yes ''|make -s"))

The yes '' stuff is for when buildroot asks for user input.

-- 
Bye, Peter Korsgaard
