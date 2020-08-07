From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 7 Aug 2020 21:54:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/smstools3: fix build with gcc
 10.x
In-Reply-To: <20200807125852.3739-1-mf@go-sys.de>
References: <20200807125852.3739-1-mf@go-sys.de>
Message-ID: <CAEyMn7awP+pjaPwuVgar7nF1fAnrsDTD4omOj6ZOnjq9V3LGXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michael,

Am Fr., 7. Aug. 2020 um 15:17 Uhr schrieb Michael Fischer <mf@go-sys.de>:
>
> 0001-fix-build-with-gcc-10.x.patch: Add patch to fix build with gcc 10.x
> Fetch from:
https://salsa.debian.org/debian-mobcom-team/smstools/-/blob/57a358a9eebbe2ca5639cc526f7027944ed95ea1/debian/patches/gcc10.patch
>
> Signed-off-by: Michael Fischer <mf@go-sys.de>

Tested-by: Heiko Thiery <heiko.thiery@gmail.com>


You can/should add the patch link by to SMSTOOLS_PATCH variable in the
smstools3.mk and the appropriate hash in the smstools3.hash file. With this
the patch will be downloaded automatically.

---
SMSTOOLS3_PATCH = \

https://salsa.debian.org/debian-mobcom-team/smstools/-/raw/57a358a9eebbe2ca5639cc526f7027944ed95ea1/debian/patches/gcc10.patch
---

Take a look on
https://git.buildroot.net/buildroot/tree/package/aumix/aumix.mk#n15 as an
example.

-- 
Heiko
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200807/0e1602ac/attachment.html>
