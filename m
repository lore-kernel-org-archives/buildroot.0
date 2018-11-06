From: =?UTF-8?B?0KLQuNC80YPRgCDQn9GA0L7QutC+0L/QtdC90LrQvg==?= <prok.tim26@gmail.com>
Date: Tue, 6 Nov 2018 13:29:51 +0300
Subject: [Buildroot] systemd: build fails with meson
Message-ID: <CANTMe2VOTDZTx_BjaLJ1jo1TqdU37DSMK3XuKCzL8so6pa+2gg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've been trying to build Buildroot with systemd v239. Regular build works
fine but when I try to do it using docker, the build fails with
bad interpreter: No such file or directory
which seems to be a python error which occurs when the absolute path length
to the interpreter exceeds the limit (in this case, the 1st line in
buildroot/output/host/bin/meson is over 128 symbols which is most likely
the problem).

Is there any way to solve this without shortening the absolute paths? Thank
you in advance.
-- 
Best regards,
Timur
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181106/bac8a759/attachment.html>
