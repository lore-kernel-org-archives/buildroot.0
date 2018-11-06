From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Nov 2018 11:32:33 +0100
Subject: [Buildroot] [PATCH] traceroute: fix 'no rule to make target
 -lm' error
In-Reply-To: <87pnvibjub.fsf@dell.be.48ers.dk>
References: <1539902241-10211-1-git-send-email-sergio.prado@e-labworks.com>
 <20181104114514.523365ee@windsurf> <20181104122638.7103719d@windsurf>
 <19d8f97c-f90d-9a44-6b2b-ad2132aa69af@mind.be>
 <51e4e1aa-c4c8-0353-dbfa-722756a49f71@mind.be>
 <87pnvibjub.fsf@dell.be.48ers.dk>
Message-ID: <230f4f88-a3e3-264a-62a1-ac28540d2b00@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/11/18 11:07, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>  >  Muhaha. In other words, -lNAME dependencies are broken for cross-compilation!
>  > Indeed, this is coded like this in make (remake.c):
> 
> Yes :/
> 
> At least I think that they are fairly rarely used.
> 
>  >  Bottom line: it looks like Sergio's patch is indeed correct, and moreover, it
>  > looks like it might be better to add it to TARGET_MAKE_ENV. Note sure if we want
>  > to take the risk at this point to make such a landslide change?
> 
> I am about to cut -rc1, so I don't want to do it on master. I suggest we
> merge Sergio's patch (with the above description) and then create a new
> patch for next to add it globally to TARGET_MAKE_ENV.
> 
> OK?

 Sounds good to me.

> 
>>> I guess that that is completely unrelated though.
> 
>  >  So this is completely unrelated: it is because the way glob is used in make is
>  > incompatible with glibc-2.28. But since any distro which has glibc-2.28 also has
>  > make >= 4.0, it's not so important to fix I guess. OTOH it's just a simple
>  > upstream patch.
> 
> Ok, so not really that important. I'm fine with either adding the patch
> or just waiting for the next make bump (that will presumably include
> it).

 Yes it's an upstream patch. But the make releases are relatively rare.

 Regards,
 Arnout
