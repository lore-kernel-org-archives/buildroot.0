From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Wed, 18 Jan 2017 07:13:22 +0100
Subject: [Buildroot] [PATCH] package/libcap: fix build with gperf >= 3.1
In-Reply-To: <20170117221723.10235-1-romain.naour@gmail.com>
References: <20170117221723.10235-1-romain.naour@gmail.com>
Message-ID: <CAM+bi4vyuxJXco0-bey20xb1aEt_NZr765=P_8OE0yNPxy8Lzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El 17/1/2017 23:17, "Romain Naour" <romain.naour@gmail.com> escribi?:

See gperf 3.1 ChangeLog:
* The 'len' parameter of the hash function and of the lookup function is now
  of type 'size_t' instead of 'unsigned int'. This makes it safe to call
these
  functions with strings of length > 4 GB, on 64-bit machines.

[...]
I haven't checked how many packages are affected by this breakage...
---


I think there's only a handful of packages that depend on gperf. I'll try
to test them all starting this afternoon.

Sorry for the inconvenience!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170118/69dc5091/attachment.html>
