From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 20:01:19 +0200
Subject: [Buildroot] compiler plugins & compiling the kernel
In-Reply-To: <CAK7rcp_m+9YC6gJ0xyarD217F4wyjwjg9QSdBLzVgPJ9QLrm7w@mail.gmail.com>
References: <CAK7rcp_m+9YC6gJ0xyarD217F4wyjwjg9QSdBLzVgPJ9QLrm7w@mail.gmail.com>
Message-ID: <20160820200119.4ec5848b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Aug 2016 13:10:07 -0400, Kenneth Adam Miller wrote:

> I've noticed that when the kernel is built, it appears to always be
> built with the host compiler, and not the buildroot specified cross
> compiler. Why is that?

This is not true, the kernel is built with the cross-compiler.
Otherwise, Buildroot would never be able to build an ARM, PowerPC or
MIPS kernel on a x86 or x86-64 build machine.

> In addition, for some pax related options, it requires gcc plugins for
> the version being used. That means that I would have to have plugin
> support for my host, correct?

No, you would need support for plugins in the cross-compiler.

> I don't believe that there is a way to
> enable plugin support for the buildroot toolchain or for crosstool. At
> least, when I looked and searched I didn't see any option that
> mentioned that. I just want to make sure that I have it correct in
> that my host compiler is being used to build the kernel.

You're not correct. Support for plugins should be added to the
cross-compiler if you need plugin support to build your kernel.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
