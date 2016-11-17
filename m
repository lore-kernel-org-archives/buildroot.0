From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Nov 2016 12:16:38 +0100
Subject: [Buildroot] [RFC PATCH 1/1] pkg-autotools: generic configure
 fix for powerpc64
In-Reply-To: <e9261df3-b71b-1591-8064-3d1c9d82972d@mind.be>
References: <56063c394c473bf4292658511bae0dd99583be07.1479356115.git.sam.bobroff@au1.ibm.com>
 <20161117110529.55c3578e@free-electrons.com>
 <e9261df3-b71b-1591-8064-3d1c9d82972d@mind.be>
Message-ID: <20161117121638.1f8a9aef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Nov 2016 12:06:42 +0100, Arnout Vandecappelle wrote:

> > /^\s*ppc\*-\*linux\*|powerpc\*-\*linux\*)$/ {  
> 
>  How sure are you that no configure script will contain this line somewhere else
> than in the shared library test? You *have* to match the context as well - in
> particular the LD="${LD-ld} -m elf64ppc" part. This is possible with awk, but
> the patch approach is a lot simpler IMHO, and anyway easier to read.

Fine with me. I was also unsure the awk idea was better.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
