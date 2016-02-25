From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 21:50:03 +0100
Subject: [Buildroot] [PATCH v2 0/4] Add file capability/xattr support
In-Reply-To: <1456323992-27845-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1456323992-27845-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20160225215003.5886d69d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 Feb 2016 11:26:28 -0300, gustavo.zacarias at free-electrons.com
wrote:

> It's done by enabling the latest fakeroot support for it, which requires
> a attr-enabled host-libcap, which in turn needs a host-attr package to
> match as well.
> 
> It wasn't made optional since the time delta for a non-attr versus
> attr-enabled host-fakeroot and it's dependencies is just 5 seconds on a
> quad-core i5 - hardly worth the additional complexities.

Even if it's not that long, I'm not super happy with adding some more
packages to our default build, for a use case that is normally pretty
limited.

> TODO:
> This still needs matching makedevs support, or alternatively a separate
> option and data file to handle this functionality. It would probably be
> It's probably better to use this functionality with a separate tool and
> data file(s) to avoid clutternig the device table too much (ostensibly
> ACL support could be added as well).

So, if you think that specifying the capabilities or extended
attributes should be done via a separate data file, then it means we
will have a new option to specify this data file, and we could
therefore only bring the additional host-fakeroot dependencies only
when this option is enabled, no?

> Also not all target filesystems support extended attributes.

And possibly the above option should be made visible only when the
underlying filesystem supports extended attributes.

What do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
