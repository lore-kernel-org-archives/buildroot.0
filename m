From: Woody Wu <narkewoody@gmail.com>
Date: Tue, 27 Nov 2012 01:57:46 +0000 (UTC)
Subject: [Buildroot] How to regenerate zImage?
References: <slrnkamf41.9pu.narkewoody@zuhnb712.local.com>
 <20121120100158.15b1b159@skate>
 <slrnkamq24.2u9.narkewoody@zuhnb712.local.com>
 <20121121103844.0eeefba6@skate>
 <CAAsE_ud49Ku0NKg-8Ku1mbMXVxkSfLNefvV6pnst2B9GD-4o+A@mail.gmail.com>
 <20121126090218.69c0b3af@skate>
Message-ID: <slrnkb87f4.2hp.narkewoody@zuhnb712.local.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-11-26, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>
wrote:
> Dear Woody Wu,
>
> Please do not reply to me directly: always keep the list Cc'ed.
>

Sorry, I will stick to the list only.

> On Mon, 26 Nov 2012 15:32:52 +0800, Woody Wu wrote:
>> > Two solutions:
>> >
>> >  *) Do the build of the component you're actively working on
>> >  outside of Buildroot. Typically, when I do kernel hacking, I do it
>> >  outside of Buildroot, and I use Buildroot only as a final
>> >  integration mechanism, to make sure that the system build process
>> >  is reproducible. But not during development.
>> >
>> >  *) Use the OVERRIDE_SRCDIR mechanism, as documented in
>> >  http://www.elinux.org/images/2/2a/Using-buildroot-real-project.pdf,
>> >  slide 41.
>> >
>> > Best regards,
>> >
>> > Thomas
>> 
>> Thanks for the excellent slides.  But I don't understand, where to
>> input the "LINUX_OVERRIDE_SRCDIR=/my/path/of/linux".  Did I miss
>> something?
>
> You should put it in a file called "local.mk" at the root of the
> Buildroot sources directory. Note that "local.mk" is the default
> name/location, you can tune that using BR2_PACKAGE_OVERRIDE_FILE.
>

Many thanks.  I also want to do the same thing for the uboot, but I am
not certain what's the correct package name for it.  Should I use
UBOOT_OVERRIDE_SRCDIR or BOOT_OVERRIDE_SRCDIR? Thanks.

-- woody I can't go back to yesterday - because I was a different person
then.
