From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 3 Feb 2014 10:43:36 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #5 (deadline
	January 19)
In-Reply-To: <20140128205632.7b5c3100@skate>
References: <CAAXf6LVcK-fx059K=tetV=NY78amOHczPkbVxkO1pKAuvDCwtA@mail.gmail.com>
 <CAAXf6LVhGnZrVy7bTPjWa+xjbHtKrHU6pFE8aVmAmjbEB_X46w@mail.gmail.com>
 <20140128205632.7b5c3100@skate>
Message-ID: <CAAXf6LVtP8tC5R4N+P4cz1Cus3WNSuh_zch5umdhAicDigMQaw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Sorry for the late reply.

On Tue, Jan 28, 2014 at 8:56 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Mon, 20 Jan 2014 21:58:52 +0100, Thomas De Schampheleire wrote:
>
>> > [RFC,1/2] barebox: Build barebox in separate directory.
>> > Marek Belisko <marek.belisko@open-nandra.com>
>> > http://patchwork.ozlabs.org/patch/207942
>> >
>> > [RFC,2/2] barebox: Add possibility to build also barebox xloader (MLO).
>> > Marek Belisko <marek.belisko@open-nandra.com>
>> > http://patchwork.ozlabs.org/patch/207943
>>
>> No feedback. I would tend to reject these two patches, unless someone
>> still pops up and wants to adopt these patches. They introduce a
>> second build of barebox: one for the standard barebox, and another one
>> for the xloader. In fact, the only real difference seems to be that
>> both builds use a separate config file.
>
> In fact, there is a real problem that these patches from Marek are
> trying to solve. Contrary to U-Boot with which a single build produces
> both the first stage bootloader (SPL) and the second stage bootloader
> (which is compatible with how Buildroot builds U-Boot), Barebox needs
> two completely separate builds in this case. This means that currently,
> Buildroot is unable, for some platforms, to generate both the first
> stage and the second stage Barebox bootloaders.
>
> Unfortunately, I don't really see a very clean solution to this
> problem.
>

One way to do this is two create two separate packages using the same
sources: one package that builds the standard barebox, the other one
to build the xloader. This is comparable to how we have u-boot and
u-boot-tools, I'd say: two packages using the 'same' sources, to build
two separate things.

This is certainly one of the easier solutions.
To avoid duplicating the .mk file too much, we could do something
similar to what you did for gcc: one common .mk file, and a
subdirectory for each actual package.

What do you think of that?

To avoid us forgetting this patch, then, I'll delegate it to me.

Thanks,
Thomas
