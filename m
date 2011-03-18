From: bruce bushby <bruce.bushby@gmail.com>
Date: Fri, 18 Mar 2011 11:38:09 +0000
Subject: [Buildroot] [buildroot] libdrm tries to compile before cairo
In-Reply-To: <AANLkTinJmH7Jsb25KJY6WN5YZaHHKqRJO0ctNA3NmKog@mail.gmail.com>
References: <AANLkTinJmH7Jsb25KJY6WN5YZaHHKqRJO0ctNA3NmKog@mail.gmail.com>
Message-ID: <AANLkTi=jMePwkivpVNHvqvP6SYS5GCtL0YMkNGnPb84m@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Barry

I'm also new...so can't really offer anything beyond my recent experience.
Could you past your "LIBDRM_DEPENDENCIES" line?

I had some troubles adding "zeromq" until I added:
ZEROMQ_DEPENDENCIES = e2fsprogs host-pkg-config host-e2fsprogs

I suspect I don't need the "host-e2fsprogs" ..... it was only when I added
"e2fsprogs" that everything worked.

If you "de-select" libdrm and allow the build to finish and then run "make
libdrm" ... does it then compile?

My problem with zeromq complained that it couldn't find "uuid-dev" ....even
though I had selected "uuid"....turned out "e2fsprogs" provides
"uuid-dev"...just
wondering if something similar applies to "cairo.h"













On Fri, Mar 18, 2011 at 10:40 AM, Barry Kauler <bkauler@gmail.com> wrote:

> Hi, I am a first-time user of Buildroot. It has been chugging along
> nicely, but libdrm has failed to compile.
>
> It reports that 'cairo.h' is missing. Which it is, cairo has not yet
> been compiled in the target.
>
> So, using my own reasoning, I added "cairo" onto LIBDRM_DEPENDENCIES
> variable in file 'libdrm.mk'. I also deleted
> output/build/libdrm-2.4.19.
>
> However, running 'make' again, it tries to compile libdrm again, and fails.
>
> How do I make it compile cairo (and its deps) before libdrm?
>
> Regards,
> Barry Kauler
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110318/931a133b/attachment.html>
