From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Mon, 9 Sep 2013 12:36:37 -0500
Subject: [Buildroot] [PATCH 01/17] libsepol: new package
In-Reply-To: <20130906082827.5b05c498@skate>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>	<1378336196-27403-2-git-send-email-clshotwe@rockwellcollins.com>
 <20130905094446.3f139253@skate>	<OF7340EC06.079EF0FB-ON86257BDD.00464188-86257BDD.004745F1@rockwellcollins.com>
 <5228B55E.2090505@mind.be> <20130906082827.5b05c498@skate>
Message-ID: <OF08B87E80.3C853C00-ON86257BE1.006078C0-86257BE1.0060BCE7@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 09/06/2013 
01:28:27 AM:
> On Thu, 05 Sep 2013 18:46:22 +0200, Arnout Vandecappelle wrote:
> 
> >   I don't think it's really necessary to do this move 
> just because it 
> > looks nicer. I think it's better to stay with upstream. 
> Although this 
> > would be the first package to install anything in $
> (HOST_DIR)/lib, we 
> > anyway already have
> > 
> > HOST_LDFLAGS  += -L$(HOST_DIR)/lib ...
> > 
> >   We don't have an rpath for it, though, so maybe that 
> should be added.
> 
> Yes, that's the other option. I don't have a strong 
> feeling about this.
> 
> At some point, I was thinking of proposing to remove $(HOST_DIR)/usr
> and have everything under $(HOST_DIR)/ directly. The 
> advantage is that
> the binaries of the toolchain would be directly under $
> (HOST_DIR)/bin,
> which would mean creating a tarball of $(HOST_DIR) would create a
> toolchain that is more similar to other cross-compilation toolchains
> you can find around (Linaro, CodeSourcery, etc.).

I will go ahead and keep the move in there the way it currently is.  If 
the $(HOST_DIR)/usr folder is removed, there will have to be more cleanup 
to this package to have it not install into the $(HOST_DIR)/usr folder 
anyway.  All-in-all, this package does not follow standard install 
practices. 

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130909/68b775e0/attachment.html>
