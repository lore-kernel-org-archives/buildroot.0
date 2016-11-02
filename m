From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 02 Nov 2016 23:49:27 +0100
Subject: [Buildroot] [PATCH] ubifs: Fix regression in ubifs_readdir()
In-Reply-To: <20161102214927.30b0d74f@free-electrons.com>
References: <1477648432-9543-1-git-send-email-richard@nod.at>
 <1477671544.8927.1.camel@embedded.rocks>
 <c542e099-0404-be8e-ebeb-d4265d3204d6@nod.at>
 <1477693395.31471.1.camel@embedded.rocks>
 <20161101232215.5bf7cabd@free-electrons.com>
 <1478116619.8549.1.camel@embedded.rocks>
 <20161102214927.30b0d74f@free-electrons.com>
Message-ID: <1478126967.8549.4.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2016-11-02 at 21:49 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 02 Nov 2016 20:56:59 +0100, J?rg Krause wrote:
> 
> > > This is *really* bad. Which Buildroot version are you using???
> > 
> > 2016.11 #
> > 
> > Note that I am using Buildroot as a submodule [1] and I needed to
> > port
> > the br2-external tree. Maybe I messed something up?
> > 
> > > Are you able to reproduce the bad ccache behavior here???
> > 
> > Yes, I am. Linux kernel source directory is located locally and the
> > path is set using LINUX_OVERRIDE_SRCDIR in local.mk.
> > 
> > 1/ Checkout Linux kernel version 4.7.10
> > 2/ make linux-dirclean all
> > 3/ Booted Linux version is 4.7.10
> > 
> > 4/ Checkout Linux kernel version 4.8.5
> > 5/ make linux-dirclean all
> > 6/ Booted Linux version is still 4.7.10
> 
> And this scenario works fine with ccache *disabled*, but breaks when
> you enable ccache support in Buildroot?

Yes.
