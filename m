From: David du Colombier <0intro@gmail.com>
Date: Fri, 3 Oct 2014 10:53:09 +0200
Subject: [Buildroot] [PATCH v2 1/2] x264: new package
In-Reply-To: <87lhoyjkfn.fsf@dell.be.48ers.dk>
References: <1412246984-15227-1-git-send-email-0intro@gmail.com>
 <87lhoyjkfn.fsf@dell.be.48ers.dk>
Message-ID: <CANUoZoHDfyD_8R=7PdqO4Thp9-DFzULybx2hpcz0QzyuSmYYBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the review.

> If you build with a toolchain without BR2_LARGEFILE then:

Done.
The package now depends on BR2_LARGEFILE.

> - Platform specific / ASM, so there probably needs to be some
>   architecture dependencies

Done.
Now, the "--disable-asm" option is set only when the target isn't one
of arm/powerpc/x86.

> - I see a reference to threads, so it needs to depend on
>   BR2_TOOLCHAIN_HAS_THREADS

Done.
Alternatively, I chose to set the "--disable-thread" option when
the toolchain has been built without thread support.

> - It would be good with an option to enable the cli interface

Done.

> - Stripping is done on a global level if needed, the individual packages
>   shouldn't strip

Done.

I'll send a v3 of the patch.

-- 
David du Colombier
