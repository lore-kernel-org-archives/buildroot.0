From: Brendan Heading <brendanheading@gmail.com>
Date: Tue, 15 Sep 2015 22:41:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/sudo: disable use of stack
 protector when not available
In-Reply-To: <20150915233014.27cc4a34@free-electrons.com>
References: <1442342953-20312-1-git-send-email-brendanheading@gmail.com>
 <20150915233014.27cc4a34@free-electrons.com>
Message-ID: <CA+BsyQ7-YdWiOQ9E0X_+vppuB0hNdVPNV7kai9UW+1Kz5G8s3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[cc list]

>> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
>
> I'm not sure to understand here. I tested with the pre-built toolchain
> at
> http://autobuild.buildroot.org/toolchains/configs/br-arm-full.config,
> and it does properly detect that SSP support is not available:

Yup, and I think x86 works without my patch too.

My guess is that this is down to differences between how SSP is
implemented on certain arches. powerpc has a few stack protector
related failures in similar circumstances (I submitted a patch for
ruby with a similar fix). It seems that the compiler and linker
sometimes accept -fstack-protector even when SSP is unsupported.

Do you want me to dive a bit deeper ?
