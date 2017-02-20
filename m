From: jjman04 at icloud.com <jjman04@icloud.com>
Date: Mon, 20 Feb 2017 15:36:39 -0700
Subject: [Buildroot] CHIP Pro OS?
In-Reply-To: <41b15d22-f79c-3110-052f-53edfee96944@mind.be>
References: <c2ae5f05-3a98-49db-b8f7-42b5ae37fe0d@Spark>
 <20170219054019.2pithfjy3yw4ujxg@tarshish>
 <41b15d22-f79c-3110-052f-53edfee96944@mind.be>
Message-ID: <b44c39e9-4b6d-4bcf-81c5-23facb6a62b0@Spark>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you. I will try this. I'm thinking of building a lean kernel. :)

Josh

On Feb 20, 2017, 15:33 -0700, Arnout Vandecappelle <arnout@mind.be>, wrote:
> Hi Josh,
>
> On 19-02-17 06:40, Baruch Siach wrote:
> > Hi Josh,
> >
> > On Sat, Feb 18, 2017 at 09:03:30PM -0700, jjman04 at icloud.com wrote:
> > > Hi guys, I'm Josh. I wasn't sure which email to sent to, so I sent to both
> > > of the email addresses that I found.
> >
> > Please use the buildroot@ address only.
> >
> > > Here's my question:
> > >
> > > How hard would it be for me to program a (very lean) OS for CHIP Pro
> > > (https://getchip.com/pages/chippro) using Buildroot?
> >
> > Buildroot is not about programming new OSes. It builds existing OS kernels
> > (only the Linux kernel is currently supported) and some other software
> > packages to something you can run on various boards. If you are into OS
> > development check http://wiki.osdev.org/Main_Page.
>
> If you want to program an OS from scratch, you're probably better off targeting
> a much simpler CPU than the CHIP Pro. The Arduino is a classic example. The CPU
> of the CHIP Pro is pretty complicated to program, with an MMU and supervisor
> mode etc.
>
>
> That said, if you're rather looking for a cool project on the CHIP Pro, maybe
> you want to develop a lean, basic Linux distro for the CHIP Pro. That's
> something where Buildroot can help. We don't have support for the CHIP Pro at
> the moment, but the Next Thing Co people seem to have a fork with support for
> it: https://github.com/NextThingCo/CHIP-buildroot
>
> If you're going to experiment with Buildroot and you need help, you can also
> join on IRC, #buildroot.
>
>
> > > Keep in mind that I'm only 12, so I don't know many programming languages. I
> > > know a bit of Python and HTML5. I'm also learning C++ as soon as I find an
> > > online course. Would knowing those languages be enough?
> >
> > Python, HTML and C++ are not so good for OS development since their
> > implementations depend on OS provided services. You need something like C,
> > Rust, or assembly.
>
> Indeed, Python and HTML5 are interpreted languages, so you already need
> something running on your system (the interpreter) to be able to use these
> languages.
>
> Rust and C are compiled into machine code so can be executed directly by the
> CPU, without an interpreter. However, even those need a bit of setup. A C
> program needs, for example, a stack [1], and in an OS you need interrupt
> handlers [2]. For these, you have to program in assembly.
>
>
> Come to think, however, there is one option. You can start from an existing
> bootloader (e.g. U-Boot), and write a stand-alone program from there [3]. U-Boot
> will already have set up a stack etc. when it calls the program. But the program
> can do anything, so it can indeed implement a full OS. And it should be possible
> to write a stand-alone program in Rust or C++. The nice thing about this
> approach is that you can start out using some of the U-Boot functionality, for
> example to have some output. So you can get something up and running pretty
> quickly, and make it more complicated and advanced over time.
>
>
> By the way, if you still have to learn a low-level programming language, I
> think Rust is a really good option. Even if Rust never becomes popular, I think
> it's a great experience. I hope I'll get the chance to learn it myself some time :-)
>
>
> > You also need a very good understanding of your target hardware. This kind of
> > information is unfortunately not so easy to come by when dealing with
> > Allwinner based products like the CHIP Pro.
>
> True, Allwinner and documentation are not best friends :-)
>
>
> Regards,
> Arnout
>
>
> [1] https://en.wikipedia.org/wiki/Call_stack
> [2] https://en.wikipedia.org/wiki/Interrupt
> [3] http://www.denx.de/wiki/view/DULG/UBootStandalone
>
> --
> Arnout Vandecappelle arnout at mind be
> Senior Embedded Software Architect +32-16-286500 (tel:+32-16-286500)
> Essensium/Mind http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 (tel:872%20984%20063) RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint: 7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170220/05d245d6/attachment.html>
