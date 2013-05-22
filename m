From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 May 2013 17:52:59 +0200
Subject: [Buildroot] [PATCH] mongrel2: Needs a glibc or a
 uClibc-0.9.34-git based toolchain
In-Reply-To: <CAG2jQ8jBwG7odjAVHUfMYwP6_pzA90LiMkhmF6QhuK6b4eBw-w@mail.gmail.com>
References: <1369231808-11185-1-git-send-email-markos.chandras@gmail.com>
 <20130522164332.3a293c0d@skate>
 <CAG2jQ8jBwG7odjAVHUfMYwP6_pzA90LiMkhmF6QhuK6b4eBw-w@mail.gmail.com>
Message-ID: <20130522175259.6cfaad9c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Wed, 22 May 2013 15:57:36 +0100, Markos Chandras wrote:

> No problem. Although I can't find an option for external toolchain +
> eglibc. So what I have right now is this:

Yes, in the external toolchain backend, we support eglibc and glibc
similarly, so there's just one single option for both.

It is however not needed to put BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC in
your condition, because it already selects
BR2_TOOLCHAIN_EXTERNAL_GLIBC. So as far as external toolchains are
concerned, "depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC" is enough.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
