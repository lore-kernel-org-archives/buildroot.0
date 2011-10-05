From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 5 Oct 2011 19:43:16 +0200
Subject: [Buildroot] [PATCH 2/9] toolchain-external: allow specifying
	extra external libraries
In-Reply-To: <CAAXf6LUNU-py6LTR+XT56if46km_cOb6Vm_1Mg5P_O6HhpyVrw@mail.gmail.com>
References: <cover.1317583191.git.thomas.petazzoni@free-electrons.com>
 <201110042336.44134.yann.morin.1998@anciens.enib.fr>
 <CAAXf6LUNU-py6LTR+XT56if46km_cOb6Vm_1Mg5P_O6HhpyVrw@mail.gmail.com>
Message-ID: <201110051943.16683.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, All,

On Wednesday 05 October 2011 08:20:15 Thomas De Schampheleire wrote:
> On Tue, Oct 4, 2011 at 11:36 PM, Yann E. MORIN
> <yann.morin.1998@anciens.enib.fr> wrote:
> > If an application is linked against libubactrace, then it should have a
> > NEEDED entry for it, no? Or is it dlopen-ed on-demand?
> I can confirm that there is an appropriate NEEDED entry in the application.

OK, thanks for checking out.

> > The proper way to handle this would be to scan all the executables aferward,
> > looking at the DT_NEEDED flag in the ELF header, and copying the missing
> > libraries.
> >
> > Of course, this is tricky, because of the way buildroot handles the sysroot.
> > Every time the compiler is called, the sysroot is overloaded to point to the
> > staging area. This totaly highjacks the purpose of the sysroot.
> >
> > In that case, there is no need to pre-populate the rootfs with the libraries
> > from the sysroot, it should be done only at the end.
> Note that this step would need to be done at each 'make' execution, to
> cater for external applications that were copied to the rootfs
> manually (which is precisely my case).

Indeed. That's exactly what I was thinking.

> > Sadly, this has to go in for now. I'll be creating a new thread with an
> > alternate proposal, but it will require a bit more work, so I'll Ack
> > this for now.
> Ok. Thanks for your ack.

Cheers! :-)

> > Currently, this hack applies only to custom external toolchain, because
> > none of the "automatic" external toolchain currently bundles uClibc-0.9.32.
> 
> I think this would be stated more correctly as:
> "... because none of the automatic external toolchains currently add
> libraries that are not present in the explicit LIB_EXTERNAL_LIB /
> USR_LIB_EXTERNAL_LIB variables."

Yeah. I should follow a new policy: TL;DP: too late, don't post! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
