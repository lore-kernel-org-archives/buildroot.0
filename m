From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Aug 2010 23:28:11 +0200
Subject: [Buildroot] [PATCH 4/4] Fix externals-deps and source-check
	when building out of tree
In-Reply-To: <1282732120-1561-1-git-send-email-will_wagner@carallon.com> (Will
	Wagner's message of "Wed, 25 Aug 2010 11:28:40 +0100")
References: <1282732120-1561-1-git-send-email-will_wagner@carallon.com>
Message-ID: <8762ytyuqc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

 Will> Signed-off-by: Will Wagner <will_wagner@carallon.com>
 Will> ---
 Will>  Makefile |    6 +++---
 Will>  1 files changed, 3 insertions(+), 3 deletions(-)

 Will> diff --git a/Makefile b/Makefile
 Will> index 291badf..7345beb 100644
 Will> --- a/Makefile
 Will> +++ b/Makefile
 Will> @@ -432,10 +432,10 @@ endif
 Will>  source: $(TARGETS_SOURCE) $(HOST_SOURCE)
 
 Will>  _source-check:
 Will> -	$(MAKE) SPIDER=--spider source
 Will> +	$(MAKE) O=$(O) SPIDER=--spider source

No that then breaks the build for ! O=<dir> builds. I've committed a
slightly different fix that works for both situations.

I see your patch is named 4/4, but I don't see any other patches from
you around that day - Was that just a mistake or did they get lost
somehow?

-- 
Bye, Peter Korsgaard
