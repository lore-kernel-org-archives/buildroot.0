From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jan 2018 14:02:16 +0100
Subject: [Buildroot] [PATCH] support/dockerfile: add directives to run
 as non-root
In-Reply-To: <20180113112843.GF3226@scaer>
References: <20180106152833.10111-1-yann.morin.1998@free.fr>
 <20180112225408.4a91ca0b@windsurf.lan>
 <20180113112843.GF3226@scaer>
Message-ID: <20180114140216.5332b2fa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 Jan 2018 12:28:43 +0100, Yann E. MORIN wrote:

> On 2018-01-12 22:54 +0100, Thomas Petazzoni spake thusly:
> > On Sat,  6 Jan 2018 16:28:33 +0100, Yann E. MORIN wrote:  
> > > Currently, our jobs on the gitlab-ci infra are running as root, which is
> > > problematic for two reasons:
> > > 
> > >   - this is not the usual way Buildroot is built;
> > >   - it may miss issues where running as non-root is problematic.
> > > 
> > > So, complement our Dockerfile with directives to add a new user and run
> > > everything as that user, as demonstrated by this build job:
> > >     https://gitlab.com/ymorin/buildroot-ci/-/jobs/46929562
> > > 
> > > Additional, enforce an UTF-8 locale while running.
> > > 
> > > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > > Cc: Arnout Vandecappelle <arnout@mind.be>
> > > Cc: Peter Korsgaard <peter@korsgaard.com>
> > > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > > ---
> > >  support/docker/Dockerfile | 7 +++++++
> > >  1 file changed, 7 insertions(+)  
> > 
> > Applied to master, thanks. Could you update the official Buildroot
> > Docker image, so that the Gitlab CI testing benefits from this ?  
> 
> I would if I could, but I am not supposed to have push-access to that
> image, have I?

I am not sure how that works. Hopefully Arnout can give some details
about this :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
