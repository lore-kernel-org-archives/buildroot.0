From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 13 Sep 2013 09:36:20 -0500
Subject: [Buildroot] [PATCH 1/1] uboot: add support for a uEnv.txt file
In-Reply-To: <20130913090134.2b05d3e8@skate>
References: <1379029303-17804-1-git-send-email-rjbarnet@rockwellcollins.com>
 <20130913090134.2b05d3e8@skate>
Message-ID: <OFD202041F.E301E6A3-ON86257BE5.004F84A9-86257BE5.00503B17@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 09/13/2013 
02:01:34 AM:
> 
> Dear Ryan Barnett,
> 
> On Thu, 12 Sep 2013 18:41:43 -0500, Ryan Barnett wrote:
> > Some boards in u-boot support the ability to modify the environment
> > by placing a plain text file as uEnv.txt in the root of the partition
> > of an SD card. For the extact placement of where the uEnv.txt should
> > be, consult your u-boot environment. Your board supports this
> > overwriting of environment variables if "loadbootenv" and
> > "importbootenv" are defined in the board's environment.
> 
> loadbootenv and importbootenv are just U-Boot scripts that are specific
> to certain board configurations.
> 
> All what loadbootenv does it load a file into memory, and all what
> importbootenv does is call 'env import -t <addr> <size>' to load the
> environment into U-Boot.
> 
> So I don't think we should be mentioning loadbootenv and importbootenv
> here.

That is fine, and I'll remove if we decide to push forward with the patch.

> However, what I'm really wondering if is we really need this. After
> all, this is all about copying a text file to $(BINARIES_DIR),
> something a post-build or a post-image script can do perfectly fine. I
> mean, there's nothing U-Boot specific involved here, it's just a plain
> 'cp'. Therefore, I'm not sure we need this at all, but I am open to
> discussion on this.
> 

Well I do agree that it isn't difficult to place in post-build/image 
script
which is how I currently do things. My thought with adding it here is that 

it is a potential alternative to an Environment image. I didn't know about 

this feature until just within the last couple months and I always keep 
forgetting it is an option. So placing it under the "Environment image" 
may open some eye's that this option exists for them. It seems like more 
and more boards are adapting this feature.

Thanks,
-Ryan

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130913/4fb05793/attachment.html>
