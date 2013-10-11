From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 11 Oct 2013 16:51:29 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-10-10
In-Reply-To: <20131011163133.7755b2c0@skate>
References: <20131011063009.335B352C1A0@lolut.humanoidz.org>
 <CAKAx1chC4oz0iJRed6_koLNiMR=HhOSF_K__DYGhvGZXa2UrNw@mail.gmail.com>
 <CAAXf6LWPcf3LSouCznvD_R=s33OL2SyidjFSob20k-PRGczWzg@mail.gmail.com>
 <20131011163133.7755b2c0@skate>
Message-ID: <CAAXf6LUAR7P6mEwFEoeCHMq0KX_8P3LQVQvte_VvN=OTCr9T=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Lionel,

On Fri, Oct 11, 2013 at 4:31 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Fri, 11 Oct 2013 16:30:33 +0200, Thomas De Schampheleire wrote:
>
>> Thanks for this suggestion.
>> Based on this, I was able to fix the build error using:
>>
>> RUBY_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -O2"
>>
>> Now my question: would you like to send a patch for this, or would you
>> like me to do it?
>
> Should this be done only for the SuperH architecture? Only for the
> affected external toolchains?

Not sure what the best approach is. Checking just for the architecture
is the simplest.

Checking on the toolchain is complex:
- for the Sourcery toolchains: the problem shows with the most recent
SuperH toolchain we support at the moment, so I don't think it's worth
trying to avoid -O2 on older toolchains than that.

- for other external, or internal toolchains, we can't predict whether
the problem would show (I don't know which combinations of gcc, libc,
... are the killer)

What do you think?

Thomas
