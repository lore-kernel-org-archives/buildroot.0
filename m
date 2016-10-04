From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 4 Oct 2016 16:39:14 +0200
Subject: [Buildroot] [PATCH] fakeroot: bump version to 1.21-2
In-Reply-To: <20161004163555.7c8af28f@free-electrons.com>
References: <20161004115320.647-1-maxime.hadjinlian@gmail.com>
 <20161004163555.7c8af28f@free-electrons.com>
Message-ID: <CAGduivwqAtheOrr_J0XWXR-9rjWNwPC9Y0dFCqKyBua+bir0ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 4, 2016 at 4:35 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue,  4 Oct 2016 13:53:20 +0200, Maxime Hadjinlian wrote:
>
>> In this version, the configure and Makefile are not provided so we need
>> to generate them using the 'bootstrap' script included in the source.
>
> This is super annoying.
>
> First, your patch is wrong because the bootstrap script most likely
> needs autoconf and automake, possibly libtool as well, and you haven't
> added these to the fakeroot dependencies.
>
> But above all, it means that you would now be adding the build of
> autoconf and automake to *every* Buildroot build (since essentially
> host-fakeroot is always built). This is really annoying.
>
> So I'd prefer if we just took the Debian patch that works around the
> original problem.
OK, will resend.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
