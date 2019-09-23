From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 15:44:59 +0200
Subject: [Buildroot] [External] Re: [PATCH 09/30] package/musl-fts: new
 package
In-Reply-To: <CANQCQpY8Y11Xafg5abz+GbkEYQycXxwTtt2GCoz+=gRPq5GWrQ@mail.gmail.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
 <20190922090646.15130-10-thomas.petazzoni@bootlin.com>
 <CANQCQpbDfgRAvwf1caXcRJV5k1Mi=NeRyiUaE9RS-hCOQ9UWEg@mail.gmail.com>
 <20190923153337.1e4a2ed0@windsurf>
 <CANQCQpY8Y11Xafg5abz+GbkEYQycXxwTtt2GCoz+=gRPq5GWrQ@mail.gmail.com>
Message-ID: <20190923154459.0df02d82@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Sep 2019 08:36:59 -0500
Matthew Weber <matthew.weber@collins.com> wrote:

> I probably won't send a Reviewed by for the other patches individually
> but I did go through them and it looks good.  (Had a few side
> conversations on the host selinux dependency removal for
> policycoreutils and it seems fine)

Thanks!

Speaking of host python dependencies, I'm also wondering about making
the host-python dependency of host-libselinux and libsemanage optional.
Indeed, they are only needed if you want the Python bindings of
libselinux/libsemanage on the host, and you can perfectly fine have a
working SELinux stack without those.

Now the question is what should trigger the build of those Python
bindings. A visible Config.in.host option ? A hidden Config.in.host
option, but then selected by what ? I guess it's mainly host-setools
that needs the Python bindings of host-libselinux. I'm not sure what
uses the Python bindings of host-libsemanage though.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
