From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 3 Jun 2021 09:32:57 +0200
Subject: [Buildroot] [URGENT] [PATCH 0/1] Fix Buildroot Makefile failure
 on lvm2
In-Reply-To: <20210603005805.216004-1-giulio.benetti@benettiengineering.com>
References: <20210603005805.216004-1-giulio.benetti@benettiengineering.com>
Message-ID: <1be51e20-f0b5-583b-08d4-edb9cea437e7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/06/2021 02:58, Giulio Benetti wrote:
> Commit 8a313b019c7d7e898186a8b08f9c25ae0194fa16 prevents Buildroot to
> make any target due to a endif left behing in lvm2.mk. Following patch
> removes it and make Buildroot to work again.

 Gah. I had first applied it to next and tested it there, and then I saw that it
was actually a fix so I cherry-picked it on master. There was a merge conflict
but it got resolved automatically so I didn't look at it :-(

 Thanks for the quick fix!

 Applied to master, thanks.

 Regards,
 Arnout

> 
> Giulio Benetti (1):
>   package/lvm2: remove endif that prevents Buildroot to use Makefiles at
>     all
> 
>  package/lvm2/lvm2.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
