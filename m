From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Mar 2013 19:21:56 +0100
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <5134E40D.6@petroprogram.com>
References: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
 <20130303195436.49654719@skate>
 <948441.33302.bm@smtp138.mail.ir2.yahoo.com>
 <CAKAx1cjwOtqE9ZK1RnB0=wWXhVw+8end_j8roL8RZ9aZwAj=EQ@mail.gmail.com>
 <5134E40D.6@petroprogram.com>
Message-ID: <20130304192156.7bfe23bf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Mon, 04 Mar 2013 20:12:29 +0200, Stefan Fr?berg wrote:

> *But* ... (and this is a big but) I have not tested how it reacts to
> kernel events after boot when you *plug/unplug* devices and if mdev
> is capable of *running programs/scripts when some event happens*.

mdev is capable of running programs/scripts when some event happens,
even after boot time. I've already used this capability to notify an
application when a USB input device is added/removed from the system,
or to trigger a system upgrade when a USB key is inserted.

However, if an application relies on libudev to get notifications of
devices appearing/disappearing, or other services, then of course, it
cannot work with mdev.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
