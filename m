From: Poole, Donald R. <drpoole@swri.org>
Date: Tue, 24 Jan 2012 19:59:50 +0000
Subject: [Buildroot] FW: Buildroot RFS Login Question
In-Reply-To: <CB44467D.2D31%donald.poole@swri.org>
Message-ID: <CB4468D5.2D36%donald.poole@swri.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 22, 2012 at 3:43 PM, Peter Korsgaard <jacmet at sunsite.dk<mailto:jacmet@sunsite.dk>> wrote:
>>>>> "Donald" == Donald Poole <donny3000 at gmail.com<mailto:donny3000@gmail.com>> writes:

Hi,

CC'ed the buildroot list. Please keep replies on the list as well.

 Donald> Hello Peter,

 Donald>     First off, I would like to send my thanks and gratitude to
 Donald>     you and your team for creating/maintaining the buildroot
 Donald>     embedded filesystem generator.   It is a wonderful tool
 Donald>     that has save me (and I'm sure countless others) a lot of
 Donald>     time putting together a robust working filesytem for
 Donald>     embedded systems.

Thanks!

 Donald>     But, I do have a question regarding how
 Donald>     to login into the system once the filesystem is copied over
 Donald>     to the flash medium, nfs, etc.  Is there a particular
 Donald>     username/password to use for logging into the system once
 Donald>     booted?  I've searched the internet and read a lot of
 Donald>     mailing lists and forums with no success.  My only solution
 Donald>     is to edit the /etc/inittab file and add the -n option for
 Donald>     no login prompt.  But I'd like use the login prompt for
 Donald>     security and not having to hack the /etc/inittab file as a
 Donald>     work-around.  I'm sure it's something dirt simple that I'm
 Donald>     missing, but I can't seem to put a finger on it.  Any help
 Donald>     would be greatly appreciated!   Thanks in advance!

Ehh, unless you are using a custom filesystem skeleton, you should have
a root user without any password set. Does that not work for you?

If it doesn't, then please provide some more details about your setup
(buildroot config, how you boot your system, error messages?, ..)

--
Bye, Peter Korsgaard

Unfortunately, if I use the root user get a "Login Incorrect" message and a new login prompt that looks like this:
Starting input-event-daemon: done

Welcome to VICTORY Embedded
victory-embedded login: root
Login incorrect

victory-embedded login:

I'm using the default filesystem skeleton.  I'm not sure what buildroot config information would be helpful, so I will need some more direction on what to give you guys for assistance. But i am using udev, my getty port is ttymxc0 at 115200 baudrate and I'm using BusyBox 1.19.x in the "Package Selection for Target" configuration.  I'm also using buildroot version builroot-2011.11.

Thanks,
Donald R. Poole, Jr.
Research Engineer
Voice: 210.522.3131 | Fax: 210.522.4931
Tactical Networks & Communications (tacticalnetworks.swri.org)
Southwest Research Institute (SwRI)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120124/85d121a6/attachment.html>
