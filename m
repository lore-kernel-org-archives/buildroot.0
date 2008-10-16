From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 16 Oct 2008 23:22:30 +0200
Subject: [Buildroot] [PATCH 2/9] Fix link flags of mtdutils
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909B55B74@mi8nycmail19.Mi8.com>
References: <20081016225130.491d128c@surf>
	<BD79186B4FD85F4B8E60E381CAEE1909B55B74@mi8nycmail19.Mi8.com>
Message-ID: <20081016212230.GF11249@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 16, 2008 at 05:15:40PM -0400, hartleys wrote:
>On Thursday, October 16, 2008 1:52 PM, Thomas Petazzoni wrote:
>>> The mtd makefile fragment doesn't specify LDFLAGS.  This can cause
>>> the linking to fail when trying to find libz if using an external 
>>> toolchain
>>
>> This is a problem I also face with many other packages (libpng,
>> directfb, etc.). So I've proposed another, more radical patch:
>>
>> http://buildroot.uclibc.org/lists/buildroot/2008-October/011017.html
>>
>> Sadly, I didn't get any feedback about it.
>
>Add usbutils to the list of packages with the same problem.
>
>I figured I had something setup wrong with my external toolchain so I
>just patched the .mk files to make it work. Good to know I'm not the
>only one with problems.
>
>Just did a quick glance at the patch above, I don't think it would work
>for the mtd package. The patch add TARGET_LDFLAGS to the
>TARGET_CONFIGURE_OPTS. The mtd package doesn't use Autotools so I don't
>think it will see the change.
>
>It should work for usbutils. But I'm not sure if the "-Wl,--rpath-link
>-Wl,$(STAGING_DIR)/usr/lib" is also needed.

passing the rpath is not a proper thing imo.
>
>For reference here is what I patched to get mtd and usbutils to compile:

dead horse. Do it once but right.
