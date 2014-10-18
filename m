From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Oct 2014 13:51:02 +0200
Subject: [Buildroot] [PATCH v3 2/3] gst-ffmpeg: add --pkg-config to
 internal libav configure options
In-Reply-To: <20141017212453.GI3971@free.fr>
References: <1413142206-30581-1-git-send-email-danomimanchego123@gmail.com>
 <1413142206-30581-2-git-send-email-danomimanchego123@gmail.com>
 <20141017212453.GI3971@free.fr>
Message-ID: <20141018135102.4b4d86df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 17 Oct 2014 23:24:53 +0200, Yann E. MORIN wrote:

> > WARNING: .../output/host/usr/bin/i686-pc-linux-gnu-pkg-config not found, library detection may fail.
> 
> Instead of fixing just that one package, shouldn't we provide a symlink:
>     TUPLE-pkg-config  ->  pkg-config
> 
> This way, all packages that expect a cross-pkg-config will work without
> customisation.
> 
> Thomas, thoughts?

I don't have a very strong opinion here. How many packages expect
TUPLE-pkg-config instead of pkg-config? I'm not sure it's really the
majority, and if it's not, I prefer to keep handling this on a
per-package basis rather than adding a symlink.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
