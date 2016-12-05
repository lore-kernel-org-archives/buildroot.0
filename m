From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 22:19:22 +0100
Subject: [Buildroot] [PATCH] bluez5_utils: add autoreconf back
In-Reply-To: <d6c03c59-32b7-3749-80a7-ba4c812b3f87@mind.be>
References: <20161205131504.28872-1-gary.bisson@boundarydevices.com>
 <20161205213207.42e356af@free-electrons.com>
 <d6c03c59-32b7-3749-80a7-ba4c812b3f87@mind.be>
Message-ID: <20161205221922.13838a32@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 5 Dec 2016 22:16:03 +0100, Arnout Vandecappelle wrote:

> > Have you tried adding BLUEZ5_AUTORECONF = YES to your external.mk file?  
> 
>  That won't work, because it's used in an ifeq in the autotools-package
> expansion, and external.mk is included after the packages.

Gah.

>  It does work if you put it in override.mk, but that's not convenient in an
> external.

I guess you wanted to say "local.mk" and not "override.mk", right?

But in any case, I don't think we want to have a <pkg>_AUTORECONF = YES
in a package "just in case" someone has patches against this package in
his external tree. Otherwise, all autoconf packages should be
<pkg>_AUTORECONF = YES.

So, we've got two options here:

 1. Say that having to change the original .mk file of a package in
    Buildroot is a fact of life if you add custom patches for this
    package.

 2. Imagine a mechanism that allows the "external" stuff to set
    autoreconf on a per-package basis.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
