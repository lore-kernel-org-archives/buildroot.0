From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Dec 2010 20:34:29 +0100
Subject: [Buildroot] YAFFS2 support for buildroot
In-Reply-To: <201012081744.10248.robert.szentmihalyi@helvetica-it.com>
References: <201012081744.10248.robert.szentmihalyi@helvetica-it.com>
Message-ID: <20101208203429.5ae2cadc@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Robert,

On Wed, 8 Dec 2010 17:44:10 +0100
Robert Szentmihalyi <robert.szentmihalyi@helvetica-it.com> wrote:

> I am planning to add YAFFS2 support to buildroot.
> Is anybody else interested in that or working on it already?

I am not personaly, and I haven't heard of any effort in this direction.

> Would anybody care to give me a hint about what is the preferred way to add 
> support for a new root filesystem to buildroot, so that a patch could 
> eventually be accepted for inclusion?

It depends on what you want to be able to do:

 1) Have Buildroot generate a YAFFS2 image for the filesystem

 2) Have Buildroot patch the kernel built to support YAFFS2

1) is fairly easy, 2) is much more complicated because we don't have
(yet ?) a proper infrastructure to handle third-party kernel patches in
a generic way (even though it'd be nice to support things like Xenomai).

For 1), what you have to do is :

 *) Create a package for the userspace yaffs tools. You can look in
    package/cramfs/cramfs.mk for an example. You need to do this so
    that Buildroot builds a host version of mkyaffs and installs it in
    $(HOST_DIR)/usr/bin.

 *) Create a new filesystem format in fs/yaffs/ by taking example on
    other filesystems.

If you need any other detail or clarification about this, do not
hesitate to ask.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
