From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Nov 2017 13:30:03 +0100
Subject: [Buildroot] [RFCv1 2/4] core: change host RPATH handling
In-Reply-To: <c1b899b3-2b3b-0b35-2f4c-43f4e4935449@mind.be>
References: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
 <20171103160627.6468-3-thomas.petazzoni@free-electrons.com>
 <20171105085756.GG2996@scaer> <20171107234118.177ed856@windsurf>
 <8f6dece3-96bf-d71d-085f-117c92d6447b@mind.be>
 <20171108095545.64debde9@windsurf>
 <c1b899b3-2b3b-0b35-2f4c-43f4e4935449@mind.be>
Message-ID: <20171108133003.13a24547@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 8 Nov 2017 11:55:19 +0100, Arnout Vandecappelle wrote:

> >>> To me, this sounds very reasonable. What do you think?    
> >>
> >>  500 files is not a lot if you include staging as well  
> > 
> > Why would I include staging? I don't see at all why fixing up RPATH in
> > staging after each package build would be necessary.  
> 
>  The simplest way would be to do find $(HOST_DIR) -type f but that includes staging.

Hum, you didn't reply to my question, which was: "Why would we need to
fixup RPATHs in STAGING_DIR" ?

> >> But $(HOST_DIR)/{bin,sbin,lib} should be enough anyway.  
> 
>  So this is not true, we also need $(HOST_DIR)/$(GNU_TARGET_NAME)/{bin,lib}.
> So then it's perhaps easier to just -prune staging.

Absolutely.

> > Yes, that was my intent. If needed, we could optimize it by only doing
> > the fixup at the end of a host package installation. But since we have
> > a few target packages installing host stuff (toolchain, qt, etc.), it
> > would require them to explicitly state that they need host rpath
> > fixups. Perhaps it's easiest for now to just do the rpath fixup after
> > every package installation.  
> 
>  After every package installation would be better, yes.

ACK.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
