From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Sep 2013 09:48:37 +0200
Subject: [Buildroot] Why elf2flt is built *after* busybox
In-Reply-To: <CAFRkauBmG1T5UHKaA5tRvGqPFw2eABrPrPSKeO4L-CCOTyfu=Q@mail.gmail.com>
References: <1378225250.11000.4.camel@phoenix> <20130903193417.1a092fd5@skate>
 <CAFRkauBmG1T5UHKaA5tRvGqPFw2eABrPrPSKeO4L-CCOTyfu=Q@mail.gmail.com>
Message-ID: <20130904094837.2d7f219d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Axel Lin,

On Wed, 4 Sep 2013 07:57:12 +0800, Axel Lin wrote:

> >> Just enable elf2flt and start build.
> >> From the build log I found the build system build busybox before
> >> elf2flt. Is this normal?
> >> I thought elf2flt needs to be ready before building other packages?
> >
> > Because elf2flt support is broken and someone needs to fix it.
> > You've already sent several e-mails about this. Gustavo Zacarias is
> > working on improving the elf2flt, but on a spare time basis, so
> > it's progressing as time and motivation permits.
> >
> > Sorry to be a bit rude, but if you want things to move forward
> > faster, either send patches to fix the problems and get the thing
> > working, or hire someone to do this work for you. I'm sure ARM
> > noMMU support in Buildroot will improve, because there are more and
> > more Cortex-M systems that are capable of running Linux, but it's
> > not something that is currently well supported in Buildroot.
> 
> Hi Thomas,
> 
> I think you totally missed my point.
> I ask the question because I try to figure out the issue I found.
> I ask the question because I'm leaning using buildroot.
> It's good to know someone is working on this issue, however I didn't
> mean to push someone to work for me. That is not my intention.

The thing is that you've been posting constantly error reports about
the elf2flt support, while we have kept telling you from the beginning
that it is not well supported by Buildroot today. So keeping sending
error reports is kind of useless: at this point, someone needs to look
at the problem and fix it. I know Gustavo has started working on this,
but I believe ARM noMMU support is not his priority. If it has a higher
priority for someone else, then that someone else should work on it and
fix the issues. Constantly posting error reports will not make the
thing progress faster.

> This time my question is: Is it normal elf2flt is built *after*
> busybox? (This looks like a new founding to me)

No, this is not normal.

> I ask the question because I'm not familiar with buiildroot now, I
> even don't know how to specify package build order.

By putting the relevant dependency name in <pkg>_DEPENDENCIES, as
explained in the Buildroot documentation,
http://buildroot.org/downloads/manual/manual.html.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
