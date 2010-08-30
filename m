From: William Wagner <will_wagner@carallon.com>
Date: Mon, 30 Aug 2010 14:40:39 +0100
Subject: [Buildroot] [PATCH 4/4] Fix externals-deps and source-check
 when building out of tree
In-Reply-To: <8762ytyuqc.fsf@macbook.be.48ers.dk>
References: <1282732120-1561-1-git-send-email-will_wagner@carallon.com>
	<8762ytyuqc.fsf@macbook.be.48ers.dk>
Message-ID: <4C7BB4D7.4020909@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  On 29/08/2010 22:28, Peter Korsgaard wrote:
>
>   Will>  Signed-off-by: Will Wagner<will_wagner@carallon.com>
>   Will>  ---
>   Will>   Makefile |    6 +++---
>   Will>   1 files changed, 3 insertions(+), 3 deletions(-)
>
>   Will>  diff --git a/Makefile b/Makefile
>   Will>  index 291badf..7345beb 100644
>   Will>  --- a/Makefile
>   Will>  +++ b/Makefile
>   Will>  @@ -432,10 +432,10 @@ endif
>   Will>   source: $(TARGETS_SOURCE) $(HOST_SOURCE)
>
>   Will>   _source-check:
>   Will>  -	$(MAKE) SPIDER=--spider source
>   Will>  +	$(MAKE) O=$(O) SPIDER=--spider source
>
> No that then breaks the build for ! O=<dir>  builds. I've committed a
> slightly different fix that works for both situations.

Ok, I'll take a look at your fix to see what I did wrong!

> I see your patch is named 4/4, but I don't see any other patches from
> you around that day - Was that just a mistake or did they get lost
> somehow?
>
Was putting together some other patches for new packages, thought I'd 
send them after this release. Still not quite got the hang of git 
send-email.

Thanks
Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
