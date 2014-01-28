From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 22:10:02 +0100
Subject: [Buildroot] command line regular expression substitution fails
In-Reply-To: <52CF0287.8010505@alcatel-lucent.com>
References: <52CC7292.306@alcatel-lucent.com>
 <CAOkaJuVFmrrfda=vG-+06vJp7_jJvhnCAzJy8RJKZ8BxE6XKWA@mail.gmail.com>
 <52CD5340.2090200@alcatel-lucent.com>
 <CAOkaJuVGa4_Et8TL80MEsh8sN1mseKvQ4OZ9RzxSouytbZFUFQ@mail.gmail.com>
 <52CF0287.8010505@alcatel-lucent.com>
Message-ID: <20140128221002.157e8b71@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ed Sutter,

On Thu, 09 Jan 2014 15:11:51 -0500, Ed Sutter wrote:

> Thanks, the strange thing in my case is the iMX6 is cortex-A9, but I had 
> to step back to
> cortex-A8 in menuconfig for this to work.
> I did notice that when I use A9 vs A8, the floating point settings 
> automatically change
> in menuconfig.  I *thought* A8 & A9 were the same from that standpoint, 
> but not really
> sure.  Anyway, I plan to spend at least the next few days looking into 
> this, so hopefully I'll
> have more information soon.

No, A8 and A9 are not the same from a floating point perspective.

As visible in
http://git.buildroot.net/buildroot/tree/arch/Config.in.arm#n91, NEON
and VFPv3 is mandatory on Cortex-A8, but optional on Cortex-A9.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
