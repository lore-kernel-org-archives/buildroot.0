From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 May 2017 10:45:59 +0200
Subject: [Buildroot] invalid commads passed in compiler line results in
 failure.
In-Reply-To: <trinity-c9000ae1-4900-4b9d-b1b4-48dcecd9c904-1493971657439@3capp-mailcom-bs14>
References: <trinity-c9000ae1-4900-4b9d-b1b4-48dcecd9c904-1493971657439@3capp-mailcom-bs14>
Message-ID: <20170505104559.434875f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 5 May 2017 10:07:37 +0200, daggs wrote:

> I'm trying to add a new pkg what compile a kernel driver for arm, upon compilation, I get these errors:
> aarch64-linux-gcc.br_real: error: unrecognized argument in option ?-mabi=apcs-gnu?
> aarch64-linux-gcc.br_real: note: valid arguments to ?-mabi=? are: ilp32 lp64
> aarch64-linux-gcc.br_real: error: unrecognized command line option ?-mapcs?; did you mean ?--specs??
> aarch64-linux-gcc.br_real: error: unrecognized command line option ?-mno-sched-prolog?; did you mean ?-Wno-sign-promo??
> aarch64-linux-gcc.br_real: error: unrecognized command line option ?-msoft-float?

You are passing ARM options to an AArch64 compiler: this cannot work.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
