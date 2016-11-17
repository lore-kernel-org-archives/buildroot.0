From: William Kennington <wak@google.com>
Date: Thu, 17 Nov 2016 08:51:20 +0000
Subject: [Buildroot] [PATCH 1/1] python-protobuf: Allow host building
In-Reply-To: <20161117093239.05721e0e@free-electrons.com>
References: <20161117061212.4638-1-wak@google.com>
 <20161117093239.05721e0e@free-electrons.com>
Message-ID: <CAPnigKkVJPa4BSJc1JNLUJB9rsREJPv2pkkG_mvTwByUGWDhjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

The intention is to add nanopb as a host package for use in a library that
will also eventually be added. I can just add that to this patch series if
needed. I've never sent PR's via mail so I figured i would start with a
tiny one to try things out which is why I didn't also send nanopb.
Unfortunately the library depending on nanopb can't be added at this time
but I plan to have it upstream within a month.

Thanks,
William

On Thu, Nov 17, 2016 at 12:32 AM Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Wed, 16 Nov 2016 22:12:12 -0800, William A. Kennington III wrote:
> > Currently python-protobuf does not allow the building as a host package
> > during a cross compile. We would like to be able to build nanopb as a
> > host package but can't without host-python-protobuf.
> >
> > Google-Bug-Id: 28000875
> > Change-Id: Id09f461bda3f9c7a0bd6b5c36a6a8fa92e4adb27
> > Signed-off-by: William A. Kennington III <wak@google.com>
>
> Thanks for this contribution!
>
> However, we don't really like to have "orphan" host packages, i.e host
> packages that are not a dependency of anything else in Buildroot.
>
> Do you intend to submit a Buildroot package for nanopb? Even if it's a
> host package, it would probably be OK to have it in
> package/Config.in.host so that it appears in menuconfig.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161117/0be4cc79/attachment.html>
