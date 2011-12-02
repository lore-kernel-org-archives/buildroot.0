From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 2 Dec 2011 07:33:56 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <CAAXf6LUnHUAQk_4j2fyjE_tYum+U-i08aUKksK__tLOu0XgMeA@mail.gmail.com>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <001c01ccb07c$85e85190$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LUnHUAQk_4j2fyjE_tYum+U-i08aUKksK__tLOu0XgMeA@mail.gmail.com>
Message-ID: <201112020734.00122.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri December 2 2011, Thomas De Schampheleire wrote:
> Jeff,
> 
> On Thu, Dec 1, 2011 at 11:56 PM, Jeff Krasky <jeff.krasky@dspcg.com> wrote:
> > The following is a message from yesterday. ?It was the closest I have gotten
> > to both ethercat application and kernel modules being built. ?As can be seen
> > from the last email I sent today, I can't build either one with the new .mk
> > file. ?Something in that file only applies to buildroot-2011.11?
> >
> > Can someone help out with what I had going yesterday? ?The suggestions from
> > Thomas De Schampheleire helped to build the kernel modules, but in so doing
> > the application was no longer being built. ?I will show both .mk files. ?It
> > would get REALLY appreciated if someone would merge these for me somehow.
> >
> 
> I have the impression you are missing some basic skills, and I really
> think it will help you if you took the time to learn about them. For
> example:
> * how does make work and how are Makefiles organized
> * what is a patch, how do you apply a patch
> 
> There is some information on patching here:
> http://www.linuxchix.org/content/courses/kernel_hacking/lesson9
> but take into account that some of it is specific to the linux kernel.
> 
> 
> Regarding ethercat: what Thomas Petazzoni has provided you with is a
> patch for the entire thing, application + drivers. It is based on a
> clean 2011.11 release. Here is a step-by-step guide of things I think
> you should do:
> 
> 1. Start from a clean 2011.11 buildroot tarball (unpack it)
> 2. Move to the buildroot directory with cd
> 3. Apply the patch of ThomasP by saving the e-mail in text file format) and run:
> patch -p1 < saved-email
> You should see output like:
> patching file package/Config.in
> patching file package/igh-ethercat/Config.in
> patching file package/igh-ethercat/igh-ethercat.mk
> 
> 4. Configure buildroot properly (using make menuconfig) and don't
> forget to enable the new igh-ethercat package, which is present under
> 'Networking applications'
>

4.5 Ensure that you have a kernel version selected that is supported
by the EtherCAT patches. 
I seem to recall the most recent supported kernel in stable-1.5 was
2.6.32, __not__ 2.6.33 which was mentioned in your posts earlier.

Mike 
> 5. Run 'make'.
> 
> That should be it. Buildroot will do all the rest for you and when the
> build is done, you can test ethercat to see if everything works.
> 
> Best regards,
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
