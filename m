From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat, 28 Nov 2015 16:18:27 -0200
Subject: [Buildroot] Missing 'sys/queue.h' on musl
In-Reply-To: <20151128184915.6017fae9@free-electrons.com>
References: <CANu7NGtDTbf+0uOcqZQON_E4cwQtRzqiGU=y-NGDe3jjOF0+RQ@mail.gmail.com>
 <20151128184915.6017fae9@free-electrons.com>
Message-ID: <CANu7NGsZ6J3-n+zmKf+Ueds8_ePbvZydEPchfQokgqTAWhELHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2015-11-28 15:49 GMT-02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Sergio,
>
> On Sat, 28 Nov 2015 15:31:36 -0200, Sergio Prado wrote:
>
> > Musl does not provide a 'sys/queue.h' implementation [1].
> >
> > This is causing problems with some packages that depends on it, like
> > f2fs-tools [2] and others packages that are already fixed like libtirpc
> [3].
> >
> > Adding an implementation of 'sys/queue.h' as a patch (like in [3]) is a
> > proper way to fix this problem?
> >
> > What about creating a package with the 'sys/queue.h' implementation and
> > installing it in the staging directory. Then we would just need to make
> all
> > packages that need it depend on it when compiling with musl. Is this a
> good
> > solution?
>
> This seems like a very good idea to me: creating a package that
> installs sys/queue.h. It's a lot better than patching all the packages
> that use sys/queue.h to make them build with musl.
>
> Do you volunteer to work on this?
>

Yep. I'll do it.

The idea is use the implementation from NetBSD. Should queue.h stays inside
its package directory or should we create a repository for it? Another
option is to download the NetBSD sources from [1] but it is too big
(~140M). What is the best option?

[1] ftp://ftp.netbsd.org/pub/NetBSD/NetBSD-7.0/source/sets/


> Thanks!
>

Best regards,


>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151128/5d8345ed/attachment.html>
