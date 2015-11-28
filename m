From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat, 28 Nov 2015 18:42:37 -0200
Subject: [Buildroot] Missing 'sys/queue.h' on musl
In-Reply-To: <20151128192022.6bc8d7fd@free-electrons.com>
References: <CANu7NGtDTbf+0uOcqZQON_E4cwQtRzqiGU=y-NGDe3jjOF0+RQ@mail.gmail.com>
 <20151128184915.6017fae9@free-electrons.com>
 <CANu7NGsZ6J3-n+zmKf+Ueds8_ePbvZydEPchfQokgqTAWhELHw@mail.gmail.com>
 <20151128192022.6bc8d7fd@free-electrons.com>
Message-ID: <CANu7NGvmMFc9xADTq_ES7h=13LcnLH5yYJO9KV+8mSYSB-VVtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of making each package that needs 'sys/queue.h' select this
package, it would be better to select this package automatically when a
musl toolchain is used. That way, we won't need to change any package.

It is possible to do that?

Sergio Prado
Embedded Labworks
Office: +55 11 2628-3461
Mobile: +55 11 97123-3420

2015-11-28 16:20 GMT-02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Sergio Prado,
>
> On Sat, 28 Nov 2015 16:18:27 -0200, Sergio Prado wrote:
>
> > The idea is use the implementation from NetBSD. Should queue.h stays
> inside
> > its package directory or should we create a repository for it? Another
> > option is to download the NetBSD sources from [1] but it is too big
> > (~140M). What is the best option?
>
> Just add it inside the package directory. See package/makedevs/ for an
> example.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151128/dad23612/attachment.html>
