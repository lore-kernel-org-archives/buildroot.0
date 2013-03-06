From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Mar 2013 09:24:24 +0100
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <5136F5C4.6070300@mind.be>
References: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
 <20130303195436.49654719@skate>
 <948441.33302.bm@smtp138.mail.ir2.yahoo.com>
 <51359378.3010307@mind.be> <20130305195514.14ba14fd@skate>
 <5136F5C4.6070300@mind.be>
Message-ID: <20130306092424.52b72106@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 06 Mar 2013 08:52:36 +0100, Arnout Vandecappelle wrote:
> > Also, Olivier's patch doesn't update all the packages that depend on
> > udev so that they can either depend on the old udev, or systemd.
> 
>   Yes, that's what Olivier's patch does: packages that depend on udev 
> will use the old udev, not the systemd udev.
> 
>   Hm, just now I realized that that means that you get two udevs when 
> using systemd...

Yeah, yes this is what I meant by "Olivier's patch doesn't update all
the packages that depend on udev so that they can either depend on the
old udev, or systemd."

> OK, so this is not really the way to go :-(

Well, it might be the way to go, but it needs a bit more work.

We can make a udev-virtual package, or whatever the name, that will
depend on the old udev or systemd.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
