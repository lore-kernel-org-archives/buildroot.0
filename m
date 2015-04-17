From: Santhosh Ramani <srcoolz@gmail.com>
Date: Fri, 17 Apr 2015 10:21:49 -0500
Subject: [Buildroot] Run a custom script after USB mount
Message-ID: <CADKZYYKSc+rE2YvaBokFteSTE3gwnEvNksY1-w0HNC35u5yFig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Everyone,

I am having some trouble with udev and rules.d. The buildroot system
automatically mounts any USB memory stick at the location /media/usb0. (I
have only USB host port). I would like to execute a script every time a USB
memory stick is inserted.

I added a custom rule in rules.d - I named it *z*usbdetect.rules (z so that
it runs at the very end, since I want it to run after usbmount.rules in
/lib/udev/rules.d has finished executing)

The content of the rules file are as follows:

KERNEL=="sd*", ATTRS{mode}=="a_host", ATTRS{serial}=="musb-hdrc.0.auto",
ATTRS{product}=="MUSB HDRC host driver", RUN+="/etc/hcc/usb-detected"

I have double checked that my script has execute permissions and I can run
it by hand. Am I missing something? Can you please point me in the right
direction?

Thank you for your help.
Regards

Santhosh

-- 
Greater the Difficulty....Sweeter is the Victory
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150417/914a44d6/attachment.html>
