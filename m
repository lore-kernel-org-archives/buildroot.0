From: Arthur LAMBERT <lambertarthur22@gmail.com>
Date: Tue, 1 Dec 2015 09:49:06 +0100
Subject: [Buildroot] Compile kernel module within buildroot package
In-Reply-To: <20151130172458.0a226cd6@free-electrons.com>
References: <20151119183653.GA1025@arthur-bzh>
 <20151130172458.0a226cd6@free-electrons.com>
Message-ID: <20151201084906.GA4026@arthur-bzh>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Monday 30 Nov 2015 ? 17:24:58 (+0100), Thomas Petazzoni a ?crit :
> Dear Arthur LAMBERT,
> 

Hi Thomas,

> On Thu, 19 Nov 2015 19:36:53 +0100, Arthur LAMBERT wrote:
> 
> > I am currently using the 2015.08 version of buildroot. Kernel module compilation
> > is broken :
> 
> This problem has been fixed in 2015.08.1, you should upgrade to this
> version (which has just three commits on top of 2015.08), or
> alternatively backport
> 
>   http://git.buildroot.net/buildroot/commit/?h=2015.08.x&id=16768877e324f6e3e1291613ae5db9af0da5a2bf
> 
> I was able to reproduce your problem on 2015.08, and with just this
> commit applied, lttng-modules could be built successfully.

I already found this patch. The compilation issue is fixed thanks to this commit.
But I am always not able to get a ko file at the end of the compilation process.
Even with the master branch.

Process to run the test :

* git checkout 2015.08.1
* git checkout -f
* make distclean
* make wandboard_defconfig (I am using this defconfig for my test)
* enable lttng-modules through make menuconfig
* make lttng-modules

Check ko file in output/target, output/builf/lttng-modules-X, output/build/linux-X
 => no lttng kernel module file found.

The compilation seems to work without error. But in fact nothing is compiled at
the end of the process.

> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Arthur.
