From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 11 May 2018 23:06:36 -0300 (BRT)
Subject: [Buildroot] [PATCH 1/1] .gitignore: ignore outgoing directory
In-Reply-To: <20180428184458.310770ce@windsurf>
References: <20180308142907.3006-1-chrismcc@gmail.com>
 <20180422080532.GG12688@scaer> <20180428184458.310770ce@windsurf>
Message-ID: <977073365.261665.1526090796931.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Yann Morin" <yann.morin.1998@free.fr>, "Christopher McCrory" <chrismcc@gmail.com>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Saturday, April 28, 2018 1:44:58 PM
> Subject: Re: [Buildroot] [PATCH 1/1] .gitignore: ignore outgoing directory

> Hello,
> 
> On Sun, 22 Apr 2018 10:05:32 +0200, Yann E. MORIN wrote:
>> Christopher, All,
>> 
>> On 2018-03-08 06:29 -0800, Christopher McCrory spake thusly:
>> > The buildroot documentation for submitting patches creates a new
>> > directory "outgoing".  This prevents git from nagging about untracked
>> > files.
>> > 
>> > Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
>> 
>> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> 
>> Peter, this is a candidate for 2018.02.x as well, I guess. ;-)
> 
> I'd like to challenge this patch: I am not super convinced. Creating a
> outgoing/ directory is not "git format-patch" default behavior. By
> default, the patches go in the current folder.
> 
> It's only the Buildroot manual that suggests to put them in an
> outgoing/ folder (I'm not sure why). My feeling is that the Buildroot
> manual just gives an example, and really users could put their patches
> in any other folder, and we're not going to add all random folders
> in .gitignore.
> 
> So I would say no to this patch, and therefore disagree with Yann's
> Acked-by. Peter, Arnout, could you chime in and give your opinion about
> this ?
> 
> Best regards,

If you want to ignore patches under outgoing/ then put something like
this in ~/.gitconfig:

[core]
        excludesFile = ~/.gitignore-global

And this in ~/.gitignore-global:

outgoing/*.patch
outgoing/*/*.patch

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
