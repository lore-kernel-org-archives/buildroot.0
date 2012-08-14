From: Dirk Lohse <d.lohse@meier-nt.de>
Date: Tue, 14 Aug 2012 10:27:41 +0200
Subject: [Buildroot] Login with user fails
In-Reply-To: <F1CD4B889E6D4A1CA304C713688A7AD8@meiernt.local>
References: <3C32AECB8207924A9A228348325DB2D290500A@mntserv.meier-nt.local>
 <F1CD4B889E6D4A1CA304C713688A7AD8@meiernt.local>
Message-ID: <3C32AECB8207924A9A228348325DB2D2905022@mntserv.meier-nt.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Devices are managed with mdev. /dev/tty is:

 

crw-rw-rw- 1    root tty  5,   0 Jan 1    1970 /dev/tty

 

user is in /etc/passwd and /etc/shadow, group is added.

 

The same scenario works on another embedded system with an older busybox
and also on debian based i686-machines - so it might be a bug in busybox
or kernel?!

 

Root-Login also works - so I think it could be a problem with
permissions to an device/file/...

I added the user to group "root" but this doesn't help.

 

Thanks.

 

 

Von: Diego Iastrubni [mailto:diegoiast at gmail.com] 
Gesendet: Montag, 13. August 2012 13:30
An: Dirk Lohse
Cc: buildroot at busybox.net
Betreff: Re: [Buildroot] Login with user fails

 

I saw this problem once when I worked with static devices (not
udev/mdev) and /dev/tty was missing. I am not sure if this is your
problem.

If the user available in /etc/passwd ?

On Mon, Aug 13, 2012 at 12:43 PM, Dirk Lohse <d.lohse@meier-nt.de>
wrote:

I can't login with other user than root.

 

I can give root an password and can login over serial or ssh. But I
can't add a new user and login with this one.

 

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120814/daafa98e/attachment.html>
