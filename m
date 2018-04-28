From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 18:44:58 +0200
Subject: [Buildroot] [PATCH 1/1] .gitignore: ignore outgoing directory
In-Reply-To: <20180422080532.GG12688@scaer>
References: <20180308142907.3006-1-chrismcc@gmail.com>
 <20180422080532.GG12688@scaer>
Message-ID: <20180428184458.310770ce@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Apr 2018 10:05:32 +0200, Yann E. MORIN wrote:
> Christopher, All,
> 
> On 2018-03-08 06:29 -0800, Christopher McCrory spake thusly:
> > The buildroot documentation for submitting patches creates a new
> > directory "outgoing".  This prevents git from nagging about untracked
> > files.
> > 
> > Signed-off-by: Christopher McCrory <chrismcc@gmail.com>  
> 
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Peter, this is a candidate for 2018.02.x as well, I guess. ;-)

I'd like to challenge this patch: I am not super convinced. Creating a
outgoing/ directory is not "git format-patch" default behavior. By
default, the patches go in the current folder.

It's only the Buildroot manual that suggests to put them in an
outgoing/ folder (I'm not sure why). My feeling is that the Buildroot
manual just gives an example, and really users could put their patches
in any other folder, and we're not going to add all random folders
in .gitignore.

So I would say no to this patch, and therefore disagree with Yann's
Acked-by. Peter, Arnout, could you chime in and give your opinion about
this ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
