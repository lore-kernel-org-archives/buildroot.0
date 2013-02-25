From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Feb 2013 09:34:39 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-02-23
In-Reply-To: <201302241638.19487.yann.morin.1998@free.fr>
References: <20130224073422.A0E2C43043B@lolut.humanoidz.org>
 <201302241638.19487.yann.morin.1998@free.fr>
Message-ID: <20130225093439.0b2b43b2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 24 Feb 2013 16:38:19 +0100, Yann E. MORIN wrote:

> /home/test/test/output1/build/tvheadend-v3.3/src/v4l.c:465:5: error:
> format '%llx' expects argument of type 'long long unsigned int', but
> argument 6 has type 'v4l2_std_id' [-Werror=format]

Change the code to use:

  "%s: Standard #%d: %016" PRIx64 " %s, frameperiod: %d/%d, %d lines",

PRIx64 will automatically expand to llx on 32 bits platforms, and lx on
64 bits platforms. See <inttypes.h>. I think this should fix your
problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
