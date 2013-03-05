From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Mar 2013 19:55:14 +0100
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <51359378.3010307@mind.be>
References: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
 <20130303195436.49654719@skate>
 <948441.33302.bm@smtp138.mail.ir2.yahoo.com>
 <51359378.3010307@mind.be>
Message-ID: <20130305195514.14ba14fd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 05 Mar 2013 07:40:56 +0100, Arnout Vandecappelle wrote:

>   And this is exactly what Olivier Schonken's patch does, right? For 
> systemd init systems, systemd's udev is used; for other init systems, the 
> old udev 17 is used.

udev 17 ? I guess you mean 182, right?

Sure that's what Olivier Schonken's patch does. But how compatible are
the libudev from the modern udev bundled with systemd, and the old udev?

Also, Olivier's patch doesn't update all the packages that depend on
udev so that they can either depend on the old udev, or systemd.

That's why I started this thread, to decide where we want to go, and
then implement the relevant patches. Without knowing this direction, it
was impossible to review Olivier's patch properly.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
