From: zhou qiang <zhouqiang.search@gmail.com>
Date: Tue, 30 Jul 2013 18:43:28 +0800
Subject: [Buildroot] How to login as root without password
Message-ID: <CAHbR41VH17_qSe3T92b=n61_f1a_64jVXy5rNCKaexajmWzt9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi , guys

I am working on a server (no root permision)  , my intention is to create a
root filesystem  for arm board ,and
login as root ,directly to /bin/sh(no login window ).
From the document , I know that it is not possible to use target/ , then I
create a rootfs.tar in images/  , and
extract it .what  I did  is as following :

(1)  "fakeroot tar -xvf images/rootfs.tar -C work/rootfs " to extract it to
rootfs directory ,
since no root permision , fakeroot does a great job.

(2) Adding  "ttyS0:respawn:~/bin/sh " to avoid requiring login .


After burning the filesystem to development board.
The problem is coming , current login is a ordinary user , what I expected
is root user .

Can someone help to fix this issue , any input would be great appreciated .


Regards,
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130730/ba67a5e2/attachment.html>
