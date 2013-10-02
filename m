From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Oct 2013 17:12:47 +0200
Subject: [Buildroot] [PATCH] Fix compilation of systemd with uclibc
In-Reply-To: <87wqlvpvgh.fsf@dell.be.48ers.dk>
References: <1380627492-25380-1-git-send-email-jezz@sysmic.org>
 <20131001144009.4117ea4c@skate> <87wqlvpvgh.fsf@dell.be.48ers.dk>
Message-ID: <20131002171247.0cadeb06@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 02 Oct 2013 17:02:22 +0200, Peter Korsgaard wrote:

>  Thomas> The thing that worries me is that we start to rely on uClibc
>  Thomas> features that are provided by specific patches we have added to
>  Thomas> our uClibc package. This means that an user using an uClibc
>  Thomas> toolchain provided by Analog Devices for Blackfin, or built
>  Thomas> with Crosstool-NG will no longer work properly to build those
>  Thomas> packages.
> 
> As uClibc is configurable, this can never be 100% safe, but I agree we
> should try to keep these things to a minimum.

Right, but making the assumption that uClibc provides a feature that
isn't available in the latest uClibc release doesn't seem like a
reasonable compromise in terms of external uClibc toolchain support.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
