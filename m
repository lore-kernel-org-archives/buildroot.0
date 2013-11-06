From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Nov 2013 23:06:53 +0100
Subject: [Buildroot] Qt5 puzzle
In-Reply-To: <CALo-6+gh9ZL4prfb2kVUgzFi=DZGuL7GrB4zmyqW7VL9GBgOLQ@mail.gmail.com>
References: <CALo-6+gmYsfcV1yU2oEAfkbCHCqi2YHSwp6CtvkTX8+bmfXYUw@mail.gmail.com>
 <20131106191859.2c4d295c@skate>
 <CALo-6+gh9ZL4prfb2kVUgzFi=DZGuL7GrB4zmyqW7VL9GBgOLQ@mail.gmail.com>
Message-ID: <20131106230653.70d1fe41@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Charles Krinke,

On Wed, 6 Nov 2013 12:55:05 -0800, Charles Krinke wrote:

> Yes, sir. I am attaching the config so as not to clog up the email too much
> and I appreciate your kind words as usual.

Your configuration has BR2_ARM_EABI=y, so you are *not* using the
hard-float ABI, and having USE_EABI_HARDFLOAT=0 is expected.

So what you have to understand is why Qt believes it was compiled with
-mfloat-abi=hard.

Have you changed the toolchain configuration without doing a "make
clean all" afterwards?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
