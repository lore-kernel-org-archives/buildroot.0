From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Tue, 14 Jun 2016 11:23:39 +0200
Subject: [Buildroot] [PATCH 1/1] libuio: new package
In-Reply-To: <20160613123951.1040d250@free-electrons.com>
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
 <CACt6We0-YipUKayM4i7sT=AjSi-v6bMbJv76q279Dk39ubzEcA@mail.gmail.com>
 <20160613123951.1040d250@free-electrons.com>
Message-ID: <CACt6We2V8vjhsr2gQGdi5OKvoxtZuOUunneDJagjdPjZ3nhNRQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Indeed playing around with the AUTORECONF_OPTS didn't make any difference.
So what is the best option to move forwared? Send an updated patch which
calls the custom autogen.sh script and add the needed package dependencies
(host-libtool, host-autoconf and host-automake) or use  AUTORECONF=YES and
strip out the gettext dependency. The gettext dependency isn't really
needed, and of little use if you're not using lsuio. Removing it will make
the build smaller.

regards
Joris

On 13 June 2016 at 12:39, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Mon, 13 Jun 2016 12:21:34 +0200, Joris Lijssens wrote:
>
> > The autogen script just calls autoreconf with -s -f -i, maybe we just
> have
> > to give along these options when doing AUTORECONF=YES ?
> >
> >
> > mkdir -p m4 && \
> > touch ChangeLog && \
> > autoreconf -s -f -i
>
> We are already passing -f and -i, and I don't quite see why -s would
> make a difference (it simply tells to use symlinks instead of making a
> copy).
>
> You can play around with LIBUIO_AUTORECONF_OPTS to pass more options,
> but I doubt you will see a difference.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160614/dd75723f/attachment.html>
