From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Wed, 9 Oct 2019 10:31:21 -0500
Subject: [Buildroot] Add host packages in br2-external tree?
In-Reply-To: <1570631172258.59648@amazon.com>
References: <1570631172258.59648@amazon.com>
Message-ID: <CAMQcK5JWuSYPrBHDTtyjzHZbp7rzo9VgytQrGv4aMjVpbsP7Tw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Scott,

On Wed, Oct 9, 2019 at 9:27 AM Whitney, Scott <scwhitn@amazon.com> wrote:
>
> Hello Buildroot members,
>
> We are using a br2-external tree (with BR2_EXTERNAL) to store some target
> packages/applications and some special files to generate our file system image.
>
> A co-worker and I have searched through the Buildroot manual extensively, and
> have not found a way to add host packages to a br2-external tree.  There are
> example on adding target packages through external.mk and Config.in
> (with package/pkg1/Config.in, etc.), but no examples on how to add special tools
> that we want to build and install for the host.
>
> It seems like the only mentions of Config.in.host imply that host packages can only
> be added within the Buildroot tree itself, rather than via a br2-external tree.

All that buildroot does to build the host packages menu is to include
package/Config.in.host in the top level Config.in file.

https://git.busybox.net/buildroot/tree/Config.in?id=196e3d2b3393ff477f9162a2fbb0c7df8557faf5#n875

This logic can be applied your br2-external tree. See below.

> Can host packages be added to a br2-external tree?  If so, could you provide a
> brief example?

In your br2-external/Config.in you can either define a menu for host
packages in there or include your own
br2-external/package/Config.in.host. If you go the route of
br2-external/package/Config.in.host then you will need to source all
the packages in your br2-external that have their own Config.in.host.

To select a package in the menuconfig, they will appear under
"External Options > Host" or whatever you name you Config.in.host menu
title.

Thanks,
-Ryan
