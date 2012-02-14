From: Johannes Teiwes <jteiwes@informatik.uni-bremen.de>
Date: Tue, 14 Feb 2012 10:30:45 +0100
Subject: [Buildroot] simple question about dropbear
In-Reply-To: <87zkcmwjsg.fsf@macbook.be.48ers.dk>
References: <853BA8D0-AD4E-4B14-A9E7-EC9908AE5C9A@informatik.uni-bremen.de>
 <871uq32cin.fsf@macbook.be.48ers.dk>
 <E38CC59C-6BA9-4775-9A90-5D4C13A78902@informatik.uni-bremen.de>
 <CA+appbOjdSO6HqBNCALy_SmfkKycJNV_gHJqxY1aQbfyQbXMdg@mail.gmail.com>
 <87zkcmwjsg.fsf@macbook.be.48ers.dk>
Message-ID: <BAB70BB3-C317-49C7-80E2-016DD9BECAF1@informatik.uni-bremen.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Am 13.02.2012 um 21:38 schrieb Peter Korsgaard:

>>>>>> "Spenser" == Spenser Gilliland <spenser309@gmail.com> writes:
> 
> Spenser> Johannes,
> Spenser> I'm having a similar issue with dropbear and have switched to the
> Spenser> openssh server for now.  What patches are you using for microblaze
> Spenser> strace?  I'd like to add them to my build.
> 
> So it might be a microblaze specific issue? This is Microblaze with mmu,
> right?

Yes, you're right. But i have problems investigating what the system is
actually doing when stalling the ssh-connection.

> 
> Spenser> debug1: sending SSH2_MSG_KEXDH_INIT
> Spenser> debug1: expecting SSH2_MSG_KEXDH_REPLY
> 
> This is afaik here were it generates the session key. Are you sure it
> isn't just slow? Do you have BR2_PACKAGE_DROPBEAR_SMALL enabled?

I have also BR2_PACKAGE_DROPBEAR_SMALL enabled in my configuration.
The 'slowness' can be the cause since the microblaze machine only runs at about 66MHz.

Is there any way to convince dropbear/ssh to use a small (or precomputed) session key?
If this is possible one could check, if the system-speed is really the limiting factor.

> 
> There recently was some discussion about it on the dropbear list:
> 
> http://thread.gmane.org/gmane.network.ssh.dropbear/1018
> 
> -- 
> Bye, Peter Korsgaard

Any other ideas? 
I am using static device tables and the default dev_table as my structure - maybe 
there are some devices missing or misconfigured for doing ssh right out of the box?

thanks so far,
Johannes

--
Johannes Teiwes - jteiwes at tzi.de



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120214/2b4e62be/attachment.html>
