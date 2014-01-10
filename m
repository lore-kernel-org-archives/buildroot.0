From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 10 Jan 2014 09:52:23 +0100
Subject: [Buildroot] [PATCH 4/5] system: default to empty issue/hostname
	for custom skeleton
In-Reply-To: <20140109204458.GE3713@free.fr>
References: <cover.1389134731.git.yann.morin.1998@free.fr>
 <cffd411631d99ddd729f0e29888b0fb14941889a.1389134731.git.yann.morin.1998@free.fr>
 <87r48gaoc0.fsf@dell.be.48ers.dk> <20140109204458.GE3713@free.fr>
Message-ID: <7760A17EBB28454BB3DB504F6FC2E45C@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi All;

I made this patch because I found it made more sense if I selected a custom skeleton
that in that case buildroot should not insert its own hostname, issue,TZ etc into the target root directory.
If I can achieve the same result by leaving the hostname etc... empty in buildroot menu then this is fine.
I just wanted buildroot not to overwrite anything when I selected a custom skeleton.

Best Regards, Johan


-----Oorspronkelijk bericht-----
Van: Yann E. MORIN [mailto:yann.morin.1998 at gmail.com] Namens Yann E. MORIN
Verzonden: donderdag 9 januari 2014 21:45
Aan: Peter Korsgaard
CC: buildroot at busybox.net; Sagaert Johan
Onderwerp: Re: [PATCH 4/5] system: default to empty issue/hostname for custom skeleton

Peter, All,

On 2014-01-09 21:32 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > From: Sagaert Johan <sagaert.johan@skynet.be>  > A custom skeleton 
> may include /etc/issue and/or /etc/hostname, in  > which case we do 
> not want to override them.
> 
>  > But those files could also be missing from the custom skeleton, or  
> > the user may want to override their content.
> 
>  > Make the current default value for isue and hostname depend on the  
> > generic skeleton, and default to empty for a custom skeleton.
> 
>  > Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>  > 
> [yann.morin.1998 at free.fr: change from hiding it behind SKELETON_DEFAULT
>  >     to use conditional default values; move below the skeleton choice;
>  >     improve help entries]
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Do we really need to add this extra complexity? A custom skeleton is 
> not recommended (and in any case an advanced option), and the fix for 
> people not wanting /etc/issues / hostname overwritten is very easy, 
> they can just set it to the empty string.
> 
> What do others say?

Note that this is part of the patchwork-cleanup effort #5 by Thomas DS:
    http://lists.busybox.net/pipermail/buildroot/2014-January/086071.html

The original patch was:
    http://patchwork.ozlabs.org/patch/211644/

Which is now superseded by this very patch we're discussing.

I don't much care about it either. Sagaert Johan, maybe you could expose your arguments in favour of this change?

Regards,
Yann E. MORIN.

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' 
| conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
