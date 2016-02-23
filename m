From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Tue, 23 Feb 2016 17:36:14 -0300
Subject: [Buildroot] [PATCH] procrank_linux: new package
In-Reply-To: <56CCC087.9060506@mind.be>
References: <1456242888-23322-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <56CCC087.9060506@mind.be>
Message-ID: <56CCC2BE.6060901@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/02/16 17:26, Arnout Vandecappelle wrote:

>   You forgot to add a hash file.

Are github pull hashes stable? (i.e. not tagged)

>   Check. There's a Makefile licensed GPLv2+ but I guess that's not relevant.

I've used the same logic, in the end it's the code that matters.

>   What a horrible Makefile... There is no way to pass CFLAGS and LDFLAGS.
> Fortunately, with the toolchain wrapper, this shouldn't be a problem anymore.
> Well, except for LDFLAGS. This _is_ going to be a problem on e.g. Blackfin FLAT.
> I guess a patch adding CFLAGS and LDFLAGS to the Makefiles would be upstreamable?

Actually bfin flat builds fine, it's on my testing rotation for static 
builds when there's no need for mmu since it uses an old gcc and it's 
quick to catch "newer version required" scenarios (everything quite old 
and funky).
That being said i had a previous version that i wasn't quick enough to 
submit that had a patch which was removed since upstream was quick 
enough accepting the pull (musl build fix).
Regards.
