From: Alexjan Carraturo <axjslack@gmail.com>
Date: Wed, 24 Aug 2011 11:06:08 +0200
Subject: [Buildroot] Login of Buildroot
In-Reply-To: <CALR4fEJmvv=Ywy4wenKg4+rwCfUMPDbz+W=dBiUmDm2Y8tOtMA@mail.gmail.com>
References: <CACR8Qs8iO8CmjaW4bf-XYJ3TLvW4oLJVewO4i2Mc5E7e8n0X-g@mail.gmail.com>
 <CALR4fELAirpxcgiWC_F3jOC-n8M-nA+7LS-vAzC+HyhY3T2BKw@mail.gmail.com>
 <CACR8Qs87dcKMFDsgrea881x7tod3inSJSiSct9SniTaKSF8BSQ@mail.gmail.com>
 <CALR4fEJmvv=Ywy4wenKg4+rwCfUMPDbz+W=dBiUmDm2Y8tOtMA@mail.gmail.com>
Message-ID: <CACR8Qs8yY-oXwKe7+NwqkCxs7osd8_WFfLrtedBJE3_u_LwuoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/8/24 Diego Iastrubni <diegoiast@gmail.com>:
> On Wed, Aug 24, 2011 at 11:48 AM, Alexjan Carraturo <axjslack@gmail.com> wrote:
>>> What happens if you remove "securetty"? Do you have the correct /dev/*
>>> files? (for example /dev/tty)
>
>> What do you mean with "remove securetty"; do you mean remove my tty
>> from file, or remove the file "securetty"?
> rm -f /dev/securetty
>

Sorry, may be I'm not clear enough. securetty it's a file on /etc, and
specify the tty where is possible to do a root login.

>>
>> The correct tty is present (/dev/ttyAMA0) and seems to have right
>> permissions (crw-rw-rw).
> ls -l /dev/ttyAMA0
> ls -l /dev/tty
>

the same:

crw-rw-rw- 1 root root 204, 64  6 mag 15.45 ttyAMA0
crw-rw-rw- 1 root root 4, 1  6 mag 15.45 tty1



> (passwd+login use the later one)
>

Normally there is no way to login, so I can execute command. Only in
single mode. I have already tried to do this, and doesn't work.

What I would like to have is a system with no password, as before.
Even better if I can avoid the login and use directly root.

> Next step, is to get a working shell, and run "strace passwd".
>

Why do you think that may be useful?



-- 
Alexjan Carraturo
--
Free Software User Group Italia administrator (http://www.fsugitalia.org)
Fedora/OpenSUSE Ambassador
member of FSFE Italian Team

Twitter/Facebook/Identica: axjslack
Blog: http://axjslack.wordpress.com
--
