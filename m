From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Mon, 13 Jun 2016 12:21:34 +0200
Subject: [Buildroot] [PATCH 1/1] libuio: new package
In-Reply-To: <20160613115307.17d99fd7@free-electrons.com>
References: <1465474971-4832-1-git-send-email-joris.lijssens@gmail.com>
 <20160609160710.2ec96584@free-electrons.com>
 <CACt6We1xyB0b7H8ro8jU=MVKB3XegHRVS+afY6=1pBPho5j4XA@mail.gmail.com>
 <20160609163238.44d73ab6@free-electrons.com>
 <CACt6We1Rqmqcu7m3YStBDidYtSbB-77d==mAXsAcnxaP+Zu9fQ@mail.gmail.com>
 <20160609173225.019b5431@free-electrons.com>
 <CACt6We3O=VNQsq7=E6JQXOdXLY1PrkXFx5iaVkP1NuUgpofNNA@mail.gmail.com>
 <20160613112532.42758d1d@free-electrons.com>
 <CACt6We2KKx7nO9Tj7kVQn4SQkLfp1+=YWuWi3AXAR8YZgwe7UQ@mail.gmail.com>
 <20160613115307.17d99fd7@free-electrons.com>
Message-ID: <CACt6We0-YipUKayM4i7sT=AjSi-v6bMbJv76q279Dk39ubzEcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas


On 13 June 2016 at 11:53, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> Why are we having this conversation privately instead of on the
> Buildroot mailing list?
>

Probably because i pushed reply iso reply-all :), added the mailling list
again to the list of recipients.

>
> On Mon, 13 Jun 2016 11:46:41 +0200, Joris Lijssens wrote:
>
> > LIBUIO_GETTEXTIZE = YES didn't solve the issue.
>
> Gaah.
>


>
> > But one small question, can
> > you explain what the difference is between calling the autogen.sh script
> > directly and using the autoreconfig option of buildroot?
>
> Doing <pkg>_AUTORECONF = YES also adds host-automake, host-autoconf and
> host-libtool in the dependencies of the package.
>
> If you just call autogen.sh manually, you also have to add those
> dependencies manually. Doable, but it's better when possible to use
> <pkg>_AUTORECONF = YES.
>
> Sane packages should work with "autoreconf" without any custom
> autogen.sh script.
>

The autogen script just calls autoreconf with -s -f -i, maybe we just have
to give along these options when doing AUTORECONF=YES ?


mkdir -p m4 && \
touch ChangeLog && \
autoreconf -s -f -i


regards,
Joris

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160613/526d9e20/attachment.html>
