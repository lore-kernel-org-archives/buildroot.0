From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 20:56:32 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #5 (deadline
 January 19)
In-Reply-To: <CAAXf6LVhGnZrVy7bTPjWa+xjbHtKrHU6pFE8aVmAmjbEB_X46w@mail.gmail.com>
References: <CAAXf6LVcK-fx059K=tetV=NY78amOHczPkbVxkO1pKAuvDCwtA@mail.gmail.com>
 <CAAXf6LVhGnZrVy7bTPjWa+xjbHtKrHU6pFE8aVmAmjbEB_X46w@mail.gmail.com>
Message-ID: <20140128205632.7b5c3100@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 20 Jan 2014 21:58:52 +0100, Thomas De Schampheleire wrote:

> > [RFC,1/2] barebox: Build barebox in separate directory.
> > Marek Belisko <marek.belisko@open-nandra.com>
> > http://patchwork.ozlabs.org/patch/207942
> >
> > [RFC,2/2] barebox: Add possibility to build also barebox xloader (MLO).
> > Marek Belisko <marek.belisko@open-nandra.com>
> > http://patchwork.ozlabs.org/patch/207943
> 
> No feedback. I would tend to reject these two patches, unless someone
> still pops up and wants to adopt these patches. They introduce a
> second build of barebox: one for the standard barebox, and another one
> for the xloader. In fact, the only real difference seems to be that
> both builds use a separate config file.

In fact, there is a real problem that these patches from Marek are
trying to solve. Contrary to U-Boot with which a single build produces
both the first stage bootloader (SPL) and the second stage bootloader
(which is compatible with how Buildroot builds U-Boot), Barebox needs
two completely separate builds in this case. This means that currently,
Buildroot is unable, for some platforms, to generate both the first
stage and the second stage Barebox bootloaders.

Unfortunately, I don't really see a very clean solution to this
problem.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
