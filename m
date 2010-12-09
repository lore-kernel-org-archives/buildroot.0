From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Dec 2010 20:33:02 +0100
Subject: [Buildroot] YAFFS2 support for buildroot
In-Reply-To: <201012082347.55945.robert.szentmihalyi@helvetica-it.com>
References: <201012081744.10248.robert.szentmihalyi@helvetica-it.com>
	<20101208203429.5ae2cadc@surf>
	<201012082347.55945.robert.szentmihalyi@helvetica-it.com>
Message-ID: <20101209203302.60ee10ac@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Robert,

On Wed, 8 Dec 2010 23:47:55 +0100
Robert Szentmihalyi <robert.szentmihalyi@helvetica-it.com> wrote:

> I have solved that with the attached script for now, which generates
> a patch against a given kernel which contains the yaffs2 code taken
> from the git repository plus a defconfig for our board. I place the
> generated patch in the buildroot directory and set
> BR2_LINUX_KERNEL_PATCH and BR2_LINUX_KERNEL_DEFCONFIG to make use of
> it. This works at least until I have time to think up something
> better :-)

Ok. I haven't either thought on how to integrate well-known kernel
patches. This is probably a topic on which we will work on later.

> Is there a way to pull the sources from the yaffs git repository, or
> will I have to create a pseudo package and place it in the dl
> directory? As I said, my goal is not just to make it work somehow,
> but to create a patch which can be submitted later, so that others
> can benefit from it.

Yes, the GENTARGETS and AUTOTARGETS infrastructure can both pull
sources from a git repository. Something like :

YAFFSTOOLS_SITE = git://foobar.org
YAFFSTOOLS_VERSION = somegitcommitid

See http://buildroot.org/downloads/buildroot.html#generic-reference for
more details

> I did that and I added 
> source "fs/yaffs2/Config.in"
> to
> fs/Config.in,
> but the option does not appear under "target filesystem options".

Could you post what you have done exactly ? Because from this
description, it should just work.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
