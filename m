From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Sep 2013 21:27:20 +0200
Subject: [Buildroot] Two or three stages gcc build?
In-Reply-To: <CADXR8ejAOgcjrxoHM8obEL0vFSeJhgbDn46aBT6OPpkoOfc-DQ@mail.gmail.com>
References: <CADXR8ejAOgcjrxoHM8obEL0vFSeJhgbDn46aBT6OPpkoOfc-DQ@mail.gmail.com>
Message-ID: <20130919212720.084654d0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear soochon radee,

On Thu, 19 Sep 2013 13:02:33 -0400, soochon radee wrote:

> I am also seeing the two-phase build break eglibc trying to link
> SSP-related symbols on 64-bit targets (powerpc/970, x86_64/core2) in
> libc/resolv. This happens even if SSP is enabled in .config
> 
> I've been digging around gcc-initial's configure arguments and directories
> passed around to eglibc's configure script to no avail. But, I've been able
> to make it work by forcing eglibc to assume no SSP support with the
> following patch. Hopefully this will point a way to a better solution.

Well, I've been able to fix the problem on ARM by explicitly telling
gcc-initial that the libc *will* have SSP support. However, it doesn't
work on x86 because SSP requires TLS support, which isn't provided by
gcc-initial. I am not yet sure how to fix this (enable threads in
gcc-initial, if it is even possible? switch to a three stages build
when SSP is enabled?).

I'll continue experimenting around with this.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
