From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Mar 2013 19:51:12 +0100
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <51363494.7010708@petroprogram.com>
References: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
 <20130303195436.49654719@skate>
 <948441.33302.bm@smtp138.mail.ir2.yahoo.com>
 <CAKAx1cjwOtqE9ZK1RnB0=wWXhVw+8end_j8roL8RZ9aZwAj=EQ@mail.gmail.com>
 <5134E40D.6@petroprogram.com> <20130304192156.7bfe23bf@skate>
 <5134E729.8070708@petroprogram.com> <20130304193024.0c2d0490@skate>
 <51363494.7010708@petroprogram.com>
Message-ID: <20130305195112.6d176d8b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Tue, 05 Mar 2013 20:08:20 +0200, Stefan Fr?berg wrote:

> Would it make sense to rip libudev out from latest systemd and make it
> as a separate package ?
> Just for satisfying dependency need for those packages ?

libudev on its own doesn't make any sense, it needs to communicate with
udev somehow, I believe.

And anyway, in Buildroot, we don't want to derive from upstream, so we
clearly don't want to rip some part of an upstream package and make it
a new upstream package.

If someone is not happy with upstream, then start a new upstream
project, or fix the upstream project directly. It doesn't make sense to
fix upstream at Buildroot's level.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
