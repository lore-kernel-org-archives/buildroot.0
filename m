From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Feb 2012 21:38:39 +0100
Subject: [Buildroot] simple question about dropbear
In-Reply-To: <CA+appbOjdSO6HqBNCALy_SmfkKycJNV_gHJqxY1aQbfyQbXMdg@mail.gmail.com>
 (Spenser Gilliland's message of "Mon, 13 Feb 2012 12:53:06 -0600")
References: <853BA8D0-AD4E-4B14-A9E7-EC9908AE5C9A@informatik.uni-bremen.de>
 <871uq32cin.fsf@macbook.be.48ers.dk>
 <E38CC59C-6BA9-4775-9A90-5D4C13A78902@informatik.uni-bremen.de>
 <CA+appbOjdSO6HqBNCALy_SmfkKycJNV_gHJqxY1aQbfyQbXMdg@mail.gmail.com>
Message-ID: <87zkcmwjsg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Spenser" == Spenser Gilliland <spenser309@gmail.com> writes:

 Spenser> Johannes,
 Spenser> I'm having a similar issue with dropbear and have switched to the
 Spenser> openssh server for now.  What patches are you using for microblaze
 Spenser> strace?  I'd like to add them to my build.

So it might be a microblaze specific issue? This is Microblaze with mmu,
right?

 Spenser> debug1: sending SSH2_MSG_KEXDH_INIT
 Spenser> debug1: expecting SSH2_MSG_KEXDH_REPLY

This is afaik here were it generates the session key. Are you sure it
isn't just slow? Do you have BR2_PACKAGE_DROPBEAR_SMALL enabled?

There recently was some discussion about it on the dropbear list:

http://thread.gmane.org/gmane.network.ssh.dropbear/1018

-- 
Bye, Peter Korsgaard
