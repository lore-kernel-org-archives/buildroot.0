From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2016 18:57:26 +0100
Subject: [Buildroot] Loading modules with device tree after rootfs is
	mounted
In-Reply-To: <56D191E9.3050604@mind.be> (Arnout Vandecappelle's message of
 "Sat, 27 Feb 2016 13:09:13 +0100")
References: <CANqk_c9oEnF32aeNnPzki0vr1E4-s-xxGyC5+dHAwAw6rHkLAg@mail.gmail.com>
 <56AE904B.2030906@mind.be> <87wppqsbfo.fsf@dell.be.48ers.dk>
 <56D191E9.3050604@mind.be>
Message-ID: <87h9gurq7t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> - Add a line to the init script for cold plugging modules
 >> (E.G. modules for which the devices were already present before mdev
 >> was added as the hotplug handler). mdev -s should arguable handle
 >> this, but it doesn't.

 > Well, mdev was not originally meant to do the module probing, it's
 > more of a hack on top of it. mdev was meant for changing names and
 > permissions of device nodes. So in the coldplug (mdev -s) it will
 > just handle the device nodes it finds in /sys/class.

 >> find /sys/ -name modalias | xargs sort -u | xargs modprobe -abq

 >  I wouldn't have thought of the sorting, but looks good to me.

This was cut'n'paste from:

http://lists.busybox.net/pipermail/busybox/2014-September/081780.html

Replacing the 'sort -u' with cat would also work. I'm not sure exactly
what the pros/cons of using sort -u is.

As that message states, we also need to make sure that we have a
modprobe understanding the aliases (so not the MODPROBE_SMALL busybox
variant).

-- 
Venlig hilsen,
Peter Korsgaard 
