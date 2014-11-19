From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Nov 2014 10:03:38 +0100
Subject: [Buildroot] [PATCH 2/3] live555: add support for building
 dynamic libraries
In-Reply-To: <20141119055402.GA2374@sapphire.tkos.co.il>
References: <83acc63ec240a462958adbc5bdcfea13758768d5.1416212296.git.baruch@tkos.co.il>
 <1a9971bcf4a300fcb43f9b8b3392d3c3790c1ebf.1416212296.git.baruch@tkos.co.il>
 <20141118231702.6e0ebdf0@free-electrons.com>
 <20141119055402.GA2374@sapphire.tkos.co.il>
Message-ID: <20141119100338.6daa56b0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 19 Nov 2014 07:54:02 +0200, Baruch Siach wrote:

> > I don't understand why you need a separate config.linux and
> > config.linux-with-shared-libraries. Since in Buildroot we will either
> > be building with BR2_PREFER_STATIC_LIB=y, or BR2_PREFER_STATIC_LIB
> > disabled, why not simply call the file config.linux, as it was called
> > before this patch?
> > 
> > Of course, the LIVE555_LIBRARY_LINK think is needed, but I don't see
> > why the other changes are needed.
> > 
> > Can you expand on this?
> 
> Both config.linux and config.linux-with-shared-libraries already exist in 
> upstream code. We are only appending to these files to override some 
> variables. The linux-with-shared-libraries variant defines a few additional 
> variables needed for dynamic linking (library version, installation target). 
> Aligning to upstream build procedure should be more future proof, IMO.

Thanks for the explanation, definitely makes sense. I've added part of
this paragraph of explanation to the commit log, and then applied both
this patch, as well as the patch that allows VLC to link dynamically
against live555 to the next branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
