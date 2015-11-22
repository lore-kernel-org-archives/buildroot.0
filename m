From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Nov 2015 16:32:31 +0100
Subject: [Buildroot] [PATCH v2] gpsd: add work-around and re-enable for
 microblaze
In-Reply-To: <CANu7NGsAzD7fTSZPr0rRRCaOSR6N9NCpy7mTWzJ9c7436W6LPg@mail.gmail.com>
References: <1448195040-8082-1-git-send-email-sergio.prado@e-labworks.com>
 <20151122135732.3fc6bb45@free-electrons.com>
 <CANu7NGsAzD7fTSZPr0rRRCaOSR6N9NCpy7mTWzJ9c7436W6LPg@mail.gmail.com>
Message-ID: <20151122163231.34aba054@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergio,

On Sun, 22 Nov 2015 13:27:13 -0200, Sergio Prado wrote:

> I have tested with GCC 5.2.0. The bug persists and was reported in the gcc
> bug tracker:
> 
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485
> 
> Actually, in GCC 5.X I had to also disable another optimization flag
> (-fschedule-insns). I'm finishing the tests of this change with both GCC
> 4.9 and GCC 5.2 to send you a new patch to fix it.

Great, thanks a lot for the additional testing. Please add a reference
to this gcc bug report in a comment above the CFLAGS modification in
gpsd.mk, so that we keep track of why we're doing this work-around.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
