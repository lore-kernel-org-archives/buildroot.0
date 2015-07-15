From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 15 Jul 2015 16:55:20 -0500
Subject: [Buildroot] [PATCH v7 20/22] squashfs: Add xattr support
In-Reply-To: <20150715222138.41336c86@free-electrons.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-21-git-send-email-clayton.shotwell@rockwellcollins.com>
 <20150706121602.402373fc@free-electrons.com>
 <CANn-YGTqC=bhPjybxvfbH9sVZ2Vfa6xrvKaRkVOAvKTdCV3byA@mail.gmail.com>
 <20150710222353.637179e9@free-electrons.com>
 <CANQCQpZ=b1oNNCk0viuBpjw9nw9KXMja7q4Z0qGi0Vk3kTj8NA@mail.gmail.com>
 <20150715222138.41336c86@free-electrons.com>
Message-ID: <CANQCQpa-dtKQhyPMR5Fnuq8a3HFpZ33efyTjFnXFZDm4SPhvdQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Jul 15, 2015 at 3:21 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Matthew Weber,
>
> On Sat, 11 Jul 2015 12:12:36 -0500, Matthew Weber wrote:
>
>> > No problem. However, I'm curious to know what is your use case: you are
>> > preparing a SquashFS image on your target?
>>
>> We build a x86 SELinux enabled qemu target that repackages our target
>> filesystems with pre-labelled security attributes.  Sort of a sandbox
>> approach.
>
> Why is this needed? Can you generate those security attributes at build
> time?

If you did you would need to modify the (host) Kernel on your build
machine to have all of the filesystem types w/ext attributes and
selinux enabled that you need for the rootfs creation.  Instead we
build a inbetween QEMU that performs this in a sandbox as a post build
step.  Then we can build on any unmodified distribution
(Ubuntu/CentOS/Arch/etc)....

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
