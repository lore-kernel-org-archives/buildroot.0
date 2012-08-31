From: Dirk Lohse <d.lohse@meier-nt.de>
Date: Fri, 31 Aug 2012 21:55:35 +0200
Subject: [Buildroot] Login with user fails
References: <3C32AECB8207924A9A228348325DB2D290500A@mntserv.meier-nt.local>
 <F1CD4B889E6D4A1CA304C713688A7AD8@meiernt.local>
 <3C32AECB8207924A9A228348325DB2D2905022@mntserv.meier-nt.local>
 <B33ADBE08AE44C39ADFD50C10A1CF68B@meiernt.local>
 <3C32AECB8207924A9A228348325DB2D2905032@mntserv.meier-nt.local>
 <F4F324DEB9C94E729A76361CB7EB35D7@meiernt.local>
Message-ID: <3C32AECB8207924A9A228348325DB2D26CC578@mntserv.meier-nt.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Image is here (raw image, created with buildroot): what i've done: i've changed some devices in generic device-table (added rtc, deleted unused devices)? Could this be the problem? 

http://www.diygroup.de/privat/2012_08_27_rootfs_nouserlogin.tar.bz2 <http://www.diygroup.de/privat/2012_08_27_rootfs_nouserlogin.tar.bz2> 

Config (renamed): http://www.diygroup.de/privat/buildroot.cfg

Thanks,
Dirk

________________________________

Von: Diego Iastrubni [mailto:diegoiast at gmail.com]
Gesendet: Di 14.08.2012 17:46
An: Dirk Lohse
Betreff: Re: [Buildroot] Login with user fails


yes, I mean the buildroot config. The target rootfs ... if its small and you can put it online I can play with it. Do not send it via email :)


On Tue, Aug 14, 2012 at 6:35 PM, Dirk Lohse <d.lohse@meier-nt.de> wrote:


	Dear,

	 

	i have no strace at the target. With config do you mean the buildroot-config? I can send you the target-rootfs as tar.gz if this helps.

	 

	Thanks

	 

	Von: Diego Iastrubni [mailto:diegoiast at gmail.com] 
	Gesendet: Dienstag, 14. August 2012 13:31


	An: Dirk Lohse
	Cc: buildroot at busybox.net
	Betreff: Re: [Buildroot] Login with user fails

	

	 

	Then go back to the basics - 
	


	strace passwd
	strace su random_user -c "/bin/true"
	
	Just for the record - this is working on my fresh buildroot setup. I assume this is something broken on your local setup - which means: it's fixable.
	
	Cam you post the configuration which triggers this problem ?

	

	On Tue, Aug 14, 2012 at 11:27 AM, Dirk Lohse <d.lohse@meier-nt.de> wrote:

	Devices are managed with mdev. /dev/tty is:

	 

	crw-rw-rw- 1    root tty  5,   0 Jan 1    1970 /dev/tty

	 

	user is in /etc/passwd and /etc/shadow, group is added.

	 

	The same scenario works on another embedded system with an older busybox and also on debian based i686-machines - so it might be a bug in busybox or kernel?!

	 

	Root-Login also works - so I think it could be a problem with permissions to an device/file/...

	I added the user to group "root" but this doesn't help.

	 

	Thanks.

	 

	 

	Von: Diego Iastrubni [mailto:diegoiast at gmail.com] 
	Gesendet: Montag, 13. August 2012 13:30
	An: Dirk Lohse
	Cc: buildroot at busybox.net
	Betreff: Re: [Buildroot] Login with user fails

	 

	I saw this problem once when I worked with static devices (not udev/mdev) and /dev/tty was missing. I am not sure if this is your problem.
	
	If the user available in /etc/passwd ?

	On Mon, Aug 13, 2012 at 12:43 PM, Dirk Lohse <d.lohse@meier-nt.de> wrote:

	I can't login with other user than root.

	 

	I can give root an password and can login over serial or ssh. But I can't add a new user and login with this one.

	 

	What I've done:

	# whoami

	root

	# adduser test

	New password: 123456

	Retype password: 123456

	# su test

	Killed

	# echo $?

	137

	# exit

	Welcome to Buildroot...

	tx28 login: test

	Password: 123456

	 

	Welcome to Buildroot...

	 

	 

	rootfs is mounted in r/w

	 

	Thank you.

	 

	bye

	 

	Dirk

	 

	_______________________________________________
	buildroot mailing list
	buildroot at busybox.net
	http://lists.busybox.net/mailman/listinfo/buildroot

	 

	 


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120831/83884d65/attachment.html>
