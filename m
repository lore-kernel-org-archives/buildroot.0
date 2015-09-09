From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 9 Sep 2015 12:53:24 +0200
Subject: [Buildroot] [RFC 2/6] system: clarify /dev management using
 devtmpfs + {mdev, eudev}
In-Reply-To: <55EFFE90.8090200@mind.be>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-3-git-send-email-luca@lucaceresoli.net>
 <55EFFE90.8090200@mind.be>
Message-ID: <55F00FA4.1040307@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

thanks for you review.

Arnout Vandecappelle wrote:
> On 08-09-15 23:28, Luca Ceresoli wrote:
>> We're going to introduce /dev management with mdev only (no devtmpfs),
>> which will be called "Dynamic using mdev only".
>>
>> In preparation to that addition, clarify the current /dev managements
>> systems which use devtmpfs with an additional tool. Otherwise
>> "Dynamic using mdev" and "Dynamic using mdev only" wight look quite
>> undistinguishable to mortals...
>
>   I would squash the change to the manual with patch 5/6 and squash the changes
> to the Config.in prompts into patch 3/6, since these changes are related.

Well, to be picky about bisectability, the changes in this patch should
stay together. Otherwise at some commit we'd have "Dynamic using
devtmpfs + mdev" in kconfig but "Dynamic using mdev" in the docs.

>
>   But the updated text looks good to me, so:
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>
>   Oh, perhaps you could add a brief help text to the choice options? You can more
> or less copy and paste the text from the manual. If you do add help text, do it
> as a separate patch at the end of the series so it doesn't have to be updated
> again after the introduction of mdev-only.

Good idea, I'll do it in the next iteration.

-- 
Luca
