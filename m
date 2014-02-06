From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 6 Feb 2014 15:46:25 -0500
Subject: [Buildroot] [pkg-perl infra V4 9/9] qemu: add a Config.in.host
In-Reply-To: <52F3C359.9040705@mind.be>
References: <1391608380-23240-1-git-send-email-francois.perrad@gadz.org>
 <1391608380-23240-10-git-send-email-francois.perrad@gadz.org>
 <20140205170456.2440f114@skate>
 <CAB0FRsswiwUhbho2EU-kTh1ASYYvq+_wHFtojKvfwUL92c85+g@mail.gmail.com>
 <52F3C359.9040705@mind.be>
Message-ID: <CA+-urNTFqp3geYA4ScNjccrFEAEJB6O___EztSQpWpiprOiYCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout and all,

On Thu, Feb 6, 2014 at 12:16 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
> On 05/02/14 20:48, Fran?ois Perrad wrote:
> > 2014-02-05 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> >> > Dear Francois Perrad,
> >> >
> >> > On Wed,  5 Feb 2014 14:53:00 +0100, Francois Perrad wrote:
> >>> >> after the removal of cpanminus
> >>> >>
> >>> >> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> >>> >> ---
> >>> >>  package/Config.in.host      |    1 +
> >>> >>  package/qemu/Config.in.host |   10 ++++++++++
> >>> >>  2 files changed, 11 insertions(+)
> >>> >>  create mode 100644 package/qemu/Config.in.host
> >> >
> >> > I'm not sure this should be part of the Perl patch series. At the
> >> > meeting, I think we all agreed that building the Qemu user-mode
> >> > emulation for the host is not useful as it cannot work properly.
> >> > Instead the qemu package should build the system-mode emulation for the
> >> > host, which is something that Gustavo proposed some time ago.
> >> >
> >> > So I'd say to leave Qemu on the side for now, and focus on the Perl
> >> > side of things in this patch series.
> >> >
> > Frank Hunleth needs it.
> > See http://lists.busybox.net/pipermail/buildroot/2013-December/084131.html
> > & http://patchwork.ozlabs.org/patch/299014/

That's true. I do use it for regression tests that I run against a few
really large data sets. The data set is too large to run on the
target.

>  It's true that qemu-user would be nice to have, but unless we can find a
> way to guarantee that it works, I'm also against keeping it. When the
> kernel version is inconsistent, it can really break in hard to debug ways.

The processing that I do is algorithmic so I assume that I'm not
running into the kernel version issue. I'm not sure that I understand
the versioning issue, though. Should I be concerned?

Also, I'd happily switch to running the regression tests using
system-mode, but qemu-user is just really convenient since I run the
tests against the same binaries that run on the target. Just out of
curiosity, are there any other ways that people run regression tests?

The final point that I'd make is that using qemu-user is the only way
that I know of to compile Erlang bytecode to the target's machine
code. E.g. I use qemu-user to run the cross-compiled Erlang compiler
which then can be used to turn Erlang source code into machine code
for the target. Normally interpreted Erlang bytecode works plenty
fast, but it would be nice to get a performance boost. I haven't tried
submitting a patch for this, since I know that the prerequisite
qemu-user patch isn't a favorite. Do any other interpreted languages
have this problem and if so, how have they solved it?

Given the opinions here, it sounds like the qemu-user issue is either
really hard or impossible to fix. I'd rather not waste anyone's time,
but if there were any ideas or someone just needed help finishing them
up or testing them, I'd offer some of my time to assist.

Thanks,
Frank

p.s. I have no opinion on including/excluding this patch with the Perl
series, so feel free to defer this aspect of the thread to a more
convenient time.
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot




-- 
Frank Hunleth
Troodon Software LLC
Embedded Software Development
http://troodon-software.com/
