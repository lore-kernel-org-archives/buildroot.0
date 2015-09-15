From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Sep 2015 23:44:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/sudo: disable use of stack
 protector when not available
In-Reply-To: <CA+BsyQ7-YdWiOQ9E0X_+vppuB0hNdVPNV7kai9UW+1Kz5G8s3w@mail.gmail.com>
References: <1442342953-20312-1-git-send-email-brendanheading@gmail.com>
 <20150915233014.27cc4a34@free-electrons.com>
 <CA+BsyQ7-YdWiOQ9E0X_+vppuB0hNdVPNV7kai9UW+1Kz5G8s3w@mail.gmail.com>
Message-ID: <20150915234417.4658d78e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Tue, 15 Sep 2015 22:41:11 +0100, Brendan Heading wrote:

> My guess is that this is down to differences between how SSP is
> implemented on certain arches. powerpc has a few stack protector
> related failures in similar circumstances (I submitted a patch for
> ruby with a similar fix). It seems that the compiler and linker
> sometimes accept -fstack-protector even when SSP is unsupported.

I also thought of an architecture specific issue, but I tried with
http://autobuild.buildroot.org/toolchains/configs/br-powerpc-e500mc-full.config
and it also built just fine.

I have nothing against your patch in principle, it can only be good to
explicitly disable stack protector usage when the necessary support is
not there. I'm just curious to understand why the detection does work
in certain cases and not in others.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
