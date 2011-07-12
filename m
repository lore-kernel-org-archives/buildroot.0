From: raymond zhao <raymond.zhao.ml@gmail.com>
Date: Tue, 12 Jul 2011 18:03:27 -0400
Subject: [Buildroot] how BR download the linux kernel now
In-Reply-To: <201107122259.14014.yann.morin.1998@anciens.enib.fr>
References: <CAAa76NT59eY9Kbhej2vyk23GBP-ofu5FyApsnHpsgHvSLzZaNQ@mail.gmail.com>
 <201107122259.14014.yann.morin.1998@anciens.enib.fr>
Message-ID: <CAAa76NSqWgSvUZEgtpCGvk-Ly69P9wdfSoWz1q2XC=-y7EtKFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 12, 2011 at 4:59 PM, Yann E. MORIN <
yann.morin.1998@anciens.enib.fr> wrote:

> **
>
> Raymond, All,
>
> On Tuesday 12 July 2011 22:26:49 raymond zhao wrote:
>
> > I checked out the latest version of the buildroot, and noticed that
>
> > the linux.mk was changed a lot. Thomas checked in a version with log
>
> > message "linux: convert to the GENTARGETS infrastructure". And, from
>
> > there, I am confused. How the BR download the linux kernel now? I
>
> > mean, before this version, there are download, extraction and patch.
>
> > But they are removed and there is only LINUX_DOWNLOAD_PATCHES in the
>
> > new version. Where is the script for BR to download the kernel source
>
> > code now?
>
> In a word, it's automagic, now! :-)
>
> In a hundred words, look at linux/linux.mk:
>
> - on line 9-28, we set the two variables LINUX_SITE and LINUX_TARBALL
>
> depending on the user's options
>
> - on line 180, we call GENTARGETS that generates all the reuired rules
>
> - the variable LINUX_SITE tells where the kernel is to be get from
>
> - the variable LINUX_TARBALL tells the tarball's file name
>
> - the function GENTARGETS instantiates download+extract+build+install rules
>
> for the specified package
>
> GENTARGETS is defined in package/Makefile.package.in
>
> It's the basis for the generic package infrastructure. It's a bit complex,
>
> but that Makefile is rather pretty well commented. Also, you can have a
>
> look at the doc:
>
> http://buildroot.org/buildroot.html#add_packages
>
> http://buildroot.org/buildroot.html#generic-reference
>
> Regards,
>
> Yann E. MORIN.
>
> --
>
>
> .-----------------.--------------------.------------------.--------------------.
>
> | Yann E. MORIN | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
>
> | +33 662 376 056 | Software Designer | \ / CAMPAIGN | ___ |
>
> | +33 223 225 172 `------------.-------: X AGAINST | \e/ There is no |
>
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL | v conspiracy. |
>
>
> '------------------------------^-------^------------------^--------------------'
>
>
Thanks, Yann
I do not know the initial motive of this movement, but I prefer the old
approach.
The linux kernel is a special "package". Lots of embedded projects (if not
all of them) will start from a certain version of the kernel and hack the
kernel from there, such as add device drivers etc. Then, put the source code
into a local git server to do version control. Some people argued to use
original tarball plus the patch, but it makes the development procedure very
painful. In the old approach, it is very easy to hack the linux.mk to
checkout the kernel source code directly into the output directory. But, in
the new one. Looks it becomes more complex. The kernel is very big. Check
out with the git, archive it to a tarball, and then extract it to the output
directory for building will waste lots of time. Is there a official solution
(or suggestion) for my situation?

again, thanks a lot.

Raymond
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110712/d36f142d/attachment.html>
