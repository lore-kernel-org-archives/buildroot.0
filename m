From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 10:01:07 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-09-18
In-Reply-To: <CAFOYHZDhc1KX5tEhobOgqpZ+P89xH=26oNXgv162iAEbU7taBg@mail.gmail.com>
References: <5f65af16.1c69fb81.8e15f.d9b0SMTPIN_ADDED_MISSING@mx.google.com>
 <CAFOYHZDhc1KX5tEhobOgqpZ+P89xH=26oNXgv162iAEbU7taBg@mail.gmail.com>
Message-ID: <20200919100107.6470d236@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Chris,

On Sat, 19 Sep 2020 19:56:58 +1200
Chris Packham <judge.packham@gmail.com> wrote:

> The builds are failing with "arm-none-linux-gnueabi-gcc: error:
> unrecognized command line option '-Wfloat-conversion'". This was recently
> added to the micropython Makefiles. I haven't tracked down when this was
> added to gcc but it looks like whatever version is used by these configs it
> doesn't recognize it.
> 
> The simple fix is to require a sufficiently new gcc version. I'll see if i
> can get to it this weekend unless someone beats me to it.

Thanks for the analysis. Since -Wfloat-conversion is only a warning
option, it would not be really nice to force a newer gcc version just
because of this. It would be better if the micropython build system
could enable this warning if gcc supports it, and otherwise not enable
it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
