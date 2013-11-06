From: Charles Krinke <charles.krinke@gmail.com>
Date: Wed, 6 Nov 2013 14:27:58 -0800
Subject: [Buildroot] Qt5 puzzle
In-Reply-To: <20131106230653.70d1fe41@skate>
References: <CALo-6+gmYsfcV1yU2oEAfkbCHCqi2YHSwp6CtvkTX8+bmfXYUw@mail.gmail.com>
 <20131106191859.2c4d295c@skate>
 <CALo-6+gh9ZL4prfb2kVUgzFi=DZGuL7GrB4zmyqW7VL9GBgOLQ@mail.gmail.com>
 <20131106230653.70d1fe41@skate>
Message-ID: <CALo-6+jmQbZDBSLBbR5mbDYnD=rECMnw=vg8n=ihT7=C5EKW2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hmm. You are right, sir. I need to look into that a bit more. I believe I
added a patch to the mkspec to enable neon a while back and maybe that
patch is confusing some of the build logic.

Charles


On Wed, Nov 6, 2013 at 2:06 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Charles Krinke,
>
> On Wed, 6 Nov 2013 12:55:05 -0800, Charles Krinke wrote:
>
> > Yes, sir. I am attaching the config so as not to clog up the email too
> much
> > and I appreciate your kind words as usual.
>
> Your configuration has BR2_ARM_EABI=y, so you are *not* using the
> hard-float ABI, and having USE_EABI_HARDFLOAT=0 is expected.
>
> So what you have to understand is why Qt believes it was compiled with
> -mfloat-abi=hard.
>
> Have you changed the toolchain configuration without doing a "make
> clean all" afterwards?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131106/be8b2b77/attachment-0001.html>
