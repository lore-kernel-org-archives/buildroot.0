From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Sep 2015 09:35:23 +0200
Subject: [Buildroot] [PATCH 1/3] Experimental addition of the newlib
 library
In-Reply-To: <CAOudHSVcePTAq7PLON-0Zig-JkJtTNnu-RzHtkYf0f00pe8atw@mail.gmail.com>
References: <1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com>
 <20150913101738.238ebc06@free-electrons.com>
 <CAOudHSVcePTAq7PLON-0Zig-JkJtTNnu-RzHtkYf0f00pe8atw@mail.gmail.com>
Message-ID: <20150915093523.0597731f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Sep 2015 00:06:46 -0400, Cjw X wrote:
> So, I'm going through comments and investigating. Everything seems
> pretty reasonable.

Great, thanks.

> >>  # Compute GNU_TARGET_NAME
> >> +ifeq ($(BR2_TOOLCHAIN_NO_VENDOR),y)
> >> +GNU_TARGET_NAME = $(ARCH)-$(TARGET_OS)-$(LIBC)$(ABI)
> >
> > Is it really mandatory to *not* have a vendor part of the tuple?
> 
> I've tried building arm-buildroot-none-eabi and
> arm-buildroot-none-newlibeabi, both of which, based on my
> understanding, should compile, but none of the tools build with that
> target. Binutils doesn't compile, nor does gcc. I spent some time
> looking at this, but never found an elegant solution.

Interesting. I guess we'll have to experiment a bit with this.

I'm adding Yann in Cc. Yann, have you experienced such thing when
adding bare-metal/newlib support in Crosstool-NG? I've quickly looked
at the Crosstool-NG code, and I don't see the vendor part of the tuple
being skipped specifically for bare metal/newlib toolchains, but maybe
I missed it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
