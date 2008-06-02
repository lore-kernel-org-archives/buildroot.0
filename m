From: Christopher Taylor <chtaylo3@gmail.com>
Date: Mon, 2 Jun 2008 16:08:11 -0400
Subject: [Buildroot] word swapping doubles on little endian
Message-ID: <2590773a0806021308j4137d671v15cf0d297e4c5c02@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some reason, when I write a double to file I'm getting byte
swapped then word swapped.

double value = 2.048;
printf("%llx", value);
write(&value,sizeof(double), 1, fd);

on a bigendian I'm getting
printf:  4000 624d d2f1 a9fc

on a little endian I'm getting
printf:  d2f1 a9fc 4000 624d
write:  4d62 0040 fca9 f1d2

whereas I would expect on the little endian write:
fca9 f1d2 4d62 0040


any ideas how this is getting screwed up?

-Chris
