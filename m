From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 14:58:16 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-05-01
In-Reply-To: <CAOMZO5CG_H47Xcpo=eTF+K7Rm0YMd9XTjfvzwktrYrsCKULWgA@mail.gmail.com>
References: <20170502062817.7C03E207D4@mail.free-electrons.com>
 <CAOMZO5CG_H47Xcpo=eTF+K7Rm0YMd9XTjfvzwktrYrsCKULWgA@mail.gmail.com>
Message-ID: <20170504145816.351b3345@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 4 May 2017 09:11:09 -0300, Fabio Estevam wrote:
> On Tue, May 2, 2017 at 3:28 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Hello,
> >
> > This is the list of Buildroot build failures that occured on
> > 2017-05-01, and for which you are a registered architecture developer
> > or package developer. Please help us improving the quality of
> > Buildroot by investigating those build failures and sending patches to
> > fix them. Thanks!
> >
> > Build failures related to your packages:
> >
> >          arm | atest-895b0183a89c15f5e2305... | http://autobuild.buildroot.net/results/24081a28132899e9853dcb33a345db55c7c9d04a  
> 
> What about adding a "depends on BR2_USE_MMU" to  package/atest/Config.in?
> 
> Would this be the correct fix for this issue?

No, this has absolutely nothing to do with atest. Lots of other
packages fail to build with the same reason. There is an issue between
binutils 2.27 and elf2flt.

I think we instead need to disable binutils 2.27 on !mmu, and use
binutils 2.28.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
