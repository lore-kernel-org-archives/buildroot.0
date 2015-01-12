From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Mon, 12 Jan 2015 22:35:21 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/nodejs: fix hard float error
In-Reply-To: <20150112221827.7ed3765d@free-electrons.com>
References: <1421095921-2816-1-git-send-email-jkrause@posteo.de>
 <20150112221827.7ed3765d@free-electrons.com>
Message-ID: <1421098521.1971.10.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mo, 2015-01-12 at 22:18 +0100, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Mon, 12 Jan 2015 21:52:01 +0100, J?rg Krause wrote:
> 
> > +# V8 needs to know what floating point ABI the target is using.
> > +NODEJS_ARM_FP = $(BR2_GCC_TARGET_FLOAT_ABI)
> 
> Since this variable is a string, I've added a $(call qstrip,...), for
> good measure. And then applied your patch, thanks!
> 
> Since you're looking at nodejs, can you have a look at the thread
> http://lists.busybox.net/pipermail/buildroot/2014-November/112880.html
> (which contains one patch), and send an updated patch series to make
> the necessary modifications? They looked good in principle, but not
> nicely separated in multiple patches.

I've already looked at this:
http://lists.busybox.net/pipermail/buildroot/2014-December/115275.html

In short:
  * newer npm is only installed as a module on the target, but not used
as the package manager for installing the node modules
  * I cannot find any resources about the npm options --target_arch and
--prefix

IMO, the only thing to think about is to use the -g option. This will
install also the binaries of node modules to usr/bin. But I've to check
this.

J?rg
