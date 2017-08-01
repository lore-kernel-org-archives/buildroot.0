From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Aug 2017 18:49:24 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-07-30
In-Reply-To: <CA+NV+VnF02-_eYGDycSH-EMJVZyNkjwj74dSAmxpSjLG2fobdQ@mail.gmail.com>
References: <20170731063108.12B5521DFC@mail.free-electrons.com>
 <CA+NV+VnF02-_eYGDycSH-EMJVZyNkjwj74dSAmxpSjLG2fobdQ@mail.gmail.com>
Message-ID: <20170801184924.4a82a5fa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 1 Aug 2017 22:04:07 +0530, Rahul Bedarkar wrote:

> On Mon, Jul 31, 2017 at 12:01 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Hello,
> >
> > This is the list of Buildroot build failures that occured on
> > 2017-07-30, and for which you are a registered architecture developer
> > or package developer. Please help us improving the quality of
> > Buildroot by investigating those build failures and sending patches to
> > fix them. Thanks!
> >
> > Build failures related to your packages:
> >
> >       x86_64 |           let-me-create-v1.5.2 | http://autobuild.buildroot.net/results/af946fa6fe05ee265e4ac97742b15afeb0cea1ab  
> 
> I am trying to reproduce this issue but I get following build failure
> while setting up toolchain.
> 
> >>> toolchain-external-custom  Configuring  
> Incorrect selection of kernel headers: expected 2.6.x, got 4.12.x

You have not re-used the defconfig used by the autobuilders. What
Buildroot is saying here is that:

 - The toolchain tarball contains a toolchain that uses the kernel
   headers 4.12

 - You told Buildroot, through the option
   BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD, that you have a toolchain
   that uses 2.6.x kernel headers

And therefore, Buildroot complains.

Remember that you can use the script at
https://git.buildroot.net/buildroot-test/plain/utils/br-reproduce-build
to reproduce a build failure. I.e:

	./br-reproduce-build af946fa6fe05ee265e4ac97742b15afeb0cea1ab

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
