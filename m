From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 23:51:21 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/qemu: add host-python as an
 explicit dependency
In-Reply-To: <CAJX3zAv9dAhtoiAUn-5sRFE1QOMWKK_G8P6yD1wqK25hpkq=hA@mail.gmail.com>
References: <20191111213154.19409-1-avraham.shukron@gmail.com>
 <20191111213154.19409-2-avraham.shukron@gmail.com>
 <20191112220534.531a470f@windsurf>
 <CAJX3zAuwNz7zzdrxupT+o_ZWR7AYRrk6h1XpRuYHk778pMU0ZQ@mail.gmail.com>
 <20191115220834.56a3e732@windsurf.home>
 <CAJX3zAv9dAhtoiAUn-5sRFE1QOMWKK_G8P6yD1wqK25hpkq=hA@mail.gmail.com>
Message-ID: <20191115235121.531a0e36@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Nov 2019 00:04:59 +0200
Avraham Shukron <avraham.shukron@gmail.com> wrote:

> Damn, you are right, host-python3 won't work.
> I've managed to build it only because I had host-python(2) still installed
> in my host dir during my experiments.
> A clean build still fails because there is no "python" executable in the
> host dir unless you build any python for
> the target.
> 
> So we only left with your suggestion, that in the best case (python3 is
> selected for the target)
> will only build host-python3.
> Any other case will force both host-python and host-python3 to be built.
> 
> So I'll re-submit with your $(if..) solution soon.

So, the qemu build system requires having an interpreter called "python" ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
