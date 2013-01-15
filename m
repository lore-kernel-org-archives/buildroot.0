From: Steve Calfee <stevecalfee@gmail.com>
Date: Tue, 15 Jan 2013 10:23:36 -0800
Subject: [Buildroot] New kernel source mode [Proposal]
In-Reply-To: <EE5E77B503DE9A478B63A89AAD2585EDB66A2F@vpane.excalyptech.com>
References: <EE5E77B503DE9A478B63A89AAD2585EDB66A2F@vpane.excalyptech.com>
Message-ID: <CAJJ6jxsbtr92TvkAfhz5m_Jxxp1DTA7_cmtnY5NKYMkJFYgHoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 14, 2013 at 5:12 PM, Przemyslaw Wrzos
<przemyslaw.wrzos@calyptech.com> wrote:
> Hi,
>
> I?d like to get some feedback on a feature I?d like to contribute to the
> buildroot project. I?m not quite sure what the process is so I thought I?d
> start on the mailing list.
>
> PROPOSAL:  Allow a directory (containing the source tree) to be used as the
> source for the kernel build. The source isn?t copied to the output directory
> but instead the kernel?s outputmakfile wrapper facility is used.
>
> RATIONALE:  In my project, changes to the kernel are frequent enough that it
> is ideal to be able to update the kernel source tree and then build directly
> from it.
>
> IMPLEMENTATION:  In addition to providing a new source for the linux build
> process itself, some package makefiles will need to be updated as they
> currently don?t differentiate between the kernel source tree and build tree.
>
> I have this working already though I still need to update some of the
> packages as mentioned above. I wanted to ask if there would be any interest
> in rolling this into the buildroot project upstream.
>

Hi, I am not opposed to a simple integration of kernel development
into buildroot.

However, the last time I did kernel hacking a few years ago with
buildroot, we just did not build the kernel with BR. The greatly
speeds up a BR build after a clean (If you also use an external
toolchain).

We had the kernel tree in an external git tree where we did standard
cross builds using the same compilers used by the BR. A simple script
to copy uImage and the modules to the nfs filesystem where BR was
extracted made a testable system.

So until Thomas gets his generic external package development working,
this is a handy way to split kernel development from rootfs
development.

Regards, Steve
