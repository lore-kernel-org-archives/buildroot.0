From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 18:34:34 +0100
Subject: [Buildroot] [PATCH] protobuf: bump to 2.6.1
In-Reply-To: <CAKbGBLi5tuV+opoR120-1vxZNnYH2sCQP4tYi-jE-vMoa6z51w@mail.gmail.com>
References: <1446626241-25745-1-git-send-email-steven@uplinklabs.net>
 <20151104120319.30a10287@free-electrons.com>
 <CAKbGBLhqvqwODLAj0zOxYk2Y9-NoBi_uHbS-4rHgp5TcEAV07Q@mail.gmail.com>
 <CAKbGBLi5tuV+opoR120-1vxZNnYH2sCQP4tYi-jE-vMoa6z51w@mail.gmail.com>
Message-ID: <20151104183434.1f9be07c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steven,

On Wed, 4 Nov 2015 08:58:16 -0800, Steven Noonan wrote:

> > Thanks for pointing those out. I'll take a look.
> 
> One of the threads I found is confusing. It bumped protobuf to 2.6.1
> but also enabled building for PowerPC. But I see no indication in the
> protobuf 2.6.1 sources that PowerPC is a supported architecture, so I
> wouldn't have expected it to work -- and the patch was presumably not
> applied for that reason. This issue should not affect my patch, as I
> didn't touch the architecture requirements in
> package/protobuf/Config.in (or in anything depending on protobuf).

Right.

> >> Most notably, make sure that protobuf-c builds fine, and
> >> python-protobuf builds fine. But look at the threads for other
> >> potential issues.
> 
> I'll submit a separate patch upgrading protobuf-c to v1.1.1.

Perfect.

> With the protobuf 2.6.1 patch and my [unsubmitted] protobuf-c v1.1.1
> patch, I successfully built with this defconfig (basically
> qemu_x86_64_defconfig + protobuf and any packages using it):

[...]

Excellent, thanks for your testing. I'll wait for your protobuf-c patch
then, and apply both the protobuf and protobuf-c patches.

If some people want to look at enabling PowerPC later, they can do it
as follow-up patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
