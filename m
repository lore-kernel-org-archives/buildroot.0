From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 13 Sep 2013 22:42:12 +0200
Subject: [Buildroot] [PATCH 1/1] uboot: add support for a uEnv.txt file
In-Reply-To: <OFD202041F.E301E6A3-ON86257BE5.004F84A9-86257BE5.00503B17@rockwellcollins.com>
References: <1379029303-17804-1-git-send-email-rjbarnet@rockwellcollins.com>
 <20130913090134.2b05d3e8@skate>
 <OFD202041F.E301E6A3-ON86257BE5.004F84A9-86257BE5.00503B17@rockwellcollins.com>
Message-ID: <523378A4.6080904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/09/13 16:36, Ryan Barnett wrote:
> Thomas,
>
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on
> 09/13/2013 02:01:34 AM:
>  >
>  > Dear Ryan Barnett,
>  >
>  > On Thu, 12 Sep 2013 18:41:43 -0500, Ryan Barnett wrote:
>  > > Some boards in u-boot support the ability to modify the environment
>  > > by placing a plain text file as uEnv.txt in the root of the partition
>  > > of an SD card. For the extact placement of where the uEnv.txt should
>  > > be, consult your u-boot environment. Your board supports this
>  > > overwriting of environment variables if "loadbootenv" and
>  > > "importbootenv" are defined in the board's environment.
[snip]
>  > However, what I'm really wondering if is we really need this. After
>  > all, this is all about copying a text file to $(BINARIES_DIR),
>  > something a post-build or a post-image script can do perfectly fine. I
>  > mean, there's nothing U-Boot specific involved here, it's just a plain
>  > 'cp'. Therefore, I'm not sure we need this at all, but I am open to
>  > discussion on this.
>  >
>
> Well I do agree that it isn't difficult to place in post-build/image script
> which is how I currently do things. My thought with adding it here is that
> it is a potential alternative to an Environment image. I didn't know about
> this feature until just within the last couple months and I always keep
> forgetting it is an option. So placing it under the "Environment image"
> may open some eye's that this option exists for them. It seems like more
> and more boards are adapting this feature.

  I'm with Thomas on this one. It's not buildroot's mission to replace 
the documentation of the underlying tools/packages. If there is something 
simple that we can do that saves the user a lot of time, let's go for it, 
but otherwise buildroot should be about building upstream code.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
