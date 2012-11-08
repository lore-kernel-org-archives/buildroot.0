From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Nov 2012 08:22:47 +0100
Subject: [Buildroot] [PATCH 0/2] add support for xtensa back to buildroot
In-Reply-To: <509b2928.67dc440a.70c6.6325@mx.google.com>
References: <509b2928.67dc440a.70c6.6325@mx.google.com>
Message-ID: <20121108082247.55eac2b2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Zankel,

On Wed, 07 Nov 2012 19:38:14 -0800, Chris Zankel wrote:

> It would be great if you could add support for Xtensa back to buildroot.
> I understand that it was removed because it required a lot of additional
> files and special handling, which became obsolete and hard to maintain
> over time.
> These two patches are much more aligned with other architectures with only
> very minimal overhead. I also just recently updated uClibc and can build
> buildroot out of the box, so we can now better support and maintain it.

I just skimmed through the patches, but it indeed looks a lot more
reasonable than the support we originally had for Xtensa, thanks for
this work!. One thing that should be added is to make sure that the
Crosstool-NG backend cannot be selected for Xtensa, as it doesn't
support this architecture.

Also, the issue we had with the original Xtensa implementation is that
the original submitters sent some patches that we merged, and
subsequently never maintained them. Do you have plans to use this
Xtensa architecture on a regular basis, and help us fixing build issues
related to this architecture? Of course, we don't require you any sort
of strict commitment or anything like that, I'd just like to know how
much you'll be using this architecture.

Thanks again for having worked on this,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
