From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 16 Jan 2015 08:57:51 +0100
Subject: [Buildroot] Using a local kernel tarball?
In-Reply-To: <20150115091949.48929a49@black>
References: <20150113131925.58ca1219@black>
 <18C83A04-432F-4D73-ADAC-ED64715C267E@gmail.com>
 <20150115091949.48929a49@black>
Message-ID: <CAAXf6LXPu2xyZP9=wmFgyjUNiHTh8OLHjWGCtz6jCsGj2hFS9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bill,

On Thu, Jan 15, 2015 at 4:19 PM, Bill Borton <security@conwin.com> wrote:
> Thank you sir.
>
> That was actually one of the first things I tried:
> "file://board/company/product/kernel.tar.bz"
> which doesn't work. I also tried ../ and ../../
>
> With your suggestion I went back and tried again:
> "file://../../../board/company/product/kernel.tar.bz"
> Does the trick...
>
> I knew there must be a simple solution.

You can do away with the relative paths using a make variable like TOPDIR:

BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="file://$(TOPDIR)/board/company/product/kernel.tar.bz"

Best regards,
Thomas
