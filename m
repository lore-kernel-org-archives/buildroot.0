From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Apr 2013 12:46:48 +0200
Subject: [Buildroot] [PATCH v2 4/7] arch: toolchain: Introduce binary
 format FLAT types.
In-Reply-To: <CAJxxZ0MehskGrHv15LenF25SV4YB32od+mLJAwn0WJfZbSh9Og@mail.gmail.com>
References: <1364550643-11793-1-git-send-email-sonic.adi@gmail.com>
 <1364550643-11793-4-git-send-email-sonic.adi@gmail.com>
 <20130407225132.38a9471c@skate>
 <CAJxxZ0P=w5Bv44jO6TMPnRC6e-tU6oWpV1zpsNnMAjBkofQpdw@mail.gmail.com>
 <20130413163126.0726a238@skate>
 <CAJxxZ0MehskGrHv15LenF25SV4YB32od+mLJAwn0WJfZbSh9Og@mail.gmail.com>
Message-ID: <20130416124648.6370bda6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Tue, 16 Apr 2013 18:26:22 +0800, Sonic Zhang wrote:

> > Not sure exactly if that's the right solution or not. Peter, you're the
> > one who did the external toolchain wrapper originally. Could you
> > comment on this specific issue?
> >
> The LINUX_MAKE_FLAGS should not include the shared flat specific flags
> "-mno-id-shared-library ...". Your suggestion doesn't work when
> building Linux kernel. We need some ways to remove flags
> "-mno-id-shared-library ..." from the gcc wrapper for the shared flat
> binary format when building Linux kernel.

Hm? If you pass -mno-id-shared-library after -mid-shared-library, it
will be just as if you hadn't passed the option at all. So if the
external toolchain wrapper passes -mid-shared-library, but then the
CFLAGS passed to the kernel override that by passing
-mno-id-shared-library, it will be just as if the external wrapper
hadn't passed -mid-shared-library.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
