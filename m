From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Mon, 30 May 2016 23:09:28 +0200
Subject: [Buildroot] [PATCH] build: fix umask test
In-Reply-To: <87a8j73lz2.fsf@dell.be.48ers.dk>
References: <20160530070635.GA27560@airbook.vandijck-laurijssen.be>
 <87mvn82d50.fsf@dell.be.48ers.dk> <87inxw2cnt.fsf@dell.be.48ers.dk>
 <20160530111740.14c24236@free-electrons.com>
 <20160530095319.GA5804@airbook.vandijck-laurijssen.be>
 <87a8j73lz2.fsf@dell.be.48ers.dk>
Message-ID: <20160530210928.GA19307@airbook.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> Hi,
> 
>  > I understand the zsh problem, on the other hand,
>  > any number prefixed with a 0 is octal, isn't it?
> 
> Apparently not to zsh. I haven't found any official notice about it, but
> googling around shows this (old!) patch:
> 
> http://www.zsh.org/mla/workers/1995/msg00518.html
> 
>  > Anyway, I'll re-think the patch too...
> 
> Just moving up the SHELL= line above this check should be enough.

I see, but how would that help when bash is not on the system?
Is bash a prerequisite?

I was thinking on using /bin/printf to avoid using the shell builtin.

Kurt
