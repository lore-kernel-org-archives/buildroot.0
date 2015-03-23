From: Mike Williams <mike@mikebwilliams.com>
Date: Mon, 23 Mar 2015 13:07:05 -0400
Subject: [Buildroot] systemd cleanups v2
In-Reply-To: <20150320204940.396d4c36@free-electrons.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
 <20150320204940.396d4c36@free-electrons.com>
Message-ID: <CANPyyuN-zrVxs2Z_4xOqfRaw6kPRui=yPHDp3NCeS1F_5qNDrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

> And I have also left on the side all the patches moving the udev rules
> from /lib/udev to /usr/lib/udev because for now, I'm not sure to
> understand the motivation behind this change, which seems a bit
> pointless to me at first sight.

Testing using 'udevadm test', udev only searches /etc/udev and
/usr/lib/udev, not /lib/udev. eudev is searching all three paths, but
I'm not sure if that's a eudev difference or because it is installed
to /lib.

udev's path searching behavior is documented here:
http://www.freedesktop.org/software/systemd/man/udev.html

Thanks,
Mike
