From: =?UTF-8?Q?=C5=81ukasz_Przenios=C5=82o?= <bremenpl@gmail.com>
Date: Thu, 10 Jan 2019 12:02:32 +0100
Subject: [Buildroot] Building modules during kernel compilation
Message-ID: <CA+OsCCRA3tD-BkzWi28Ld5ERJkdfGr8gp7ixMg=n5mQLQdL0KQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello there,
I am new to buildroot. I am trying to develop a driver that will amke use
of the I2C peripheral. So far I was compiling the module as an externally
loadable one (after the buildroot was compiled already). When started to
deal with I2C topics, I noticed that the i2c_register_board_info is
undefined:

WARNING: "i2c_register_board_info"
[/home/lukasz/eclipse-workspace/PowerManagerDriver/PowerManagerDriver.ko]
undefined!

Asking around on stack overflow (
https://stackoverflow.com/questions/54092530/i2c-register-board-info-symbol-is-undefined
) I came to a conclusion (please correct me if wrong one) that this symbol
will be visible only if I will compile my module during buildroot image
compilation. This would be a bit problematic for further development, since
each time I would have to reflash the image on my targets (Beaglebone
black) SD card.

If this is the case, could you please point me any easy to use resources on
how to compile my module within buildroot compilation? The info I found was
not understandable enough for me.
I would appreciate all help.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190110/96d36405/attachment.html>
