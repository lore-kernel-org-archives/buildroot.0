From: Wojciech Zabolotny <wzab01@gmail.com>
Date: Mon, 26 Dec 2011 18:53:08 +0100
Subject: [Buildroot] SOLVED! Re: Buildroot 2011.11 on x86_64 - neither udev
 nor mdev loads needed modules at startup
In-Reply-To: <CALR4fELfX4RSJyN-V+NB5sOQAQQhbrvrGqM4SU3fs-tnAyg90A@mail.gmail.com>
References: <CALR4fELfX4RSJyN-V+NB5sOQAQQhbrvrGqM4SU3fs-tnAyg90A@mail.gmail.com>
Message-ID: <4EF8B484.4050908@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Finally I've got it! The reason was so simple, that I can't believe I've spent such a long time at it :-(.

In the buildroot-2011.11 the modprobe is located in /usr/bin:
# which modprobe
/usr/bin/modprobe
However in the /lib/udev/rules.d scripts the modprobe is called as /sbin/modprobe .

So I've added the symlink /sbin/modprobe pointing to /usr/sbin/modprobe and everything works perfectly!
-- 
Thanks & Regards,
Wojtek
