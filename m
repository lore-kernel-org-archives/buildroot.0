Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858B0C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 09:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2700083EC2;
	Wed, 23 Mar 2022 09:13:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BP_Qek07tpH2; Wed, 23 Mar 2022 09:13:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30BFD82A4F;
	Wed, 23 Mar 2022 09:13:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB9901BF338
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 09:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9F4B612ED
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 09:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y0V1GHN7L1ro for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 09:13:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DBBD612E8
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 09:13:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1d34:bdfa:f457:8010])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2E06719F4C8;
 Wed, 23 Mar 2022 10:13:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1648026820;
 bh=tQ8CJIlK1eCmSad4uh+lreku0YJz+34HOufLo3nlPRg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JavaKVlWIs8cOFuSqk5mSh4XEN9tJtdy/ntEN/6ck3BVpvhyDQUL9YjxhuzZaToR5
 Banm8BVWWNG6Iq6uFxp1xW0fV4ZSiCMNU8R3x4t9BWk95pNKk3X50hYGLPmdu08HE5
 uGZsOx8qFzaA7uc+Rrtedcz84IFQYNBYfK/BkMTmVxajJSVWt23CcahthshfC+XZop
 HiNeB9iSxT8DMMvbhsYT/jTKc2rzEgzkSBHhLSY1nnk6xhVKmviW5MrOT++h16jYxc
 ZU2B12UDucotVMktOjHYw9oYWxyxtStV4ayDpePyFbzVqdjWZWZN/nktwFNkz5wqlF
 EMnSMaCg4FM2A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 23 Mar 2022 10:13:36 +0100
Date: Wed, 23 Mar 2022 10:13:36 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20220323091336.GL1566358@scaer>
References: <20220323035233.140997-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220323035233.140997-1-Jason@zx2c4.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/urandom-scripts: hash old seed with
 new seed when saving
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org, Christoph =?utf-8?Q?M=C3=BCllner?=
 <christoph.muellner@theobroma-systems.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jason, All,

On 2022-03-22 21:52 -0600, Jason A. Donenfeld spake thusly:
> Writing into /dev/urandom doesn't actually credit any entropy bits. And
> while it adds that data to the entropy pool, it won't actually be
> immediately used when reading from /dev/urandom subsequently. This is
> how the kernel's /dev/urandom has always worked, unfortunately.

Thanks for this patch. I will blindly trust whatever you state about the
kernel RNG.
    https://www.zx2c4.com/projects/linux-rng-5.17-5.18/

Still, I have a few comments about this change, see below...

> As a result of this behavior, which may be understandably surprising to
> you, writing a good seed file into /dev/urandom and then saving a new

s/to you//

(no "personal" address in a commit message)

> seed file immediately after is dangerous, because the new seed file may
> wind up being entirely deterministic, even if the old seed file was
> quite good.
> 
> I fixed this in systemd with

s/I fixed this/This has been fixed/

(but "we" as you used later is ok)

[--SNIP--]
> As a final note, while this commit improves upon the status quo by
> removing a vulnerability, this shell script still does not actually
> initialize the RNG like it says it does. For initialization via a seed
> file, the RNDADDENTROPY ioctl must be used.

Is there a way to do that within a shell script? If so, would you be
kind enough to send a followup patch, please?

> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  package/urandom-scripts/S20urandom | 30 +++++++++++-------------------
>  1 file changed, 11 insertions(+), 19 deletions(-)
> 
> diff --git a/package/urandom-scripts/S20urandom b/package/urandom-scripts/S20urandom
> index e4fd125721..f971ea905a 100644
> --- a/package/urandom-scripts/S20urandom
> +++ b/package/urandom-scripts/S20urandom
[--SNIP--]
> @@ -44,7 +34,9 @@ save_random_seed() {
>  	if touch "$URANDOM_SEED" 2> /dev/null; then
>  		old_umask=$(umask)
>  		umask 077
> -		dd if=/dev/urandom of="$URANDOM_SEED" bs="$pool_size" count=1 2> /dev/null
> +		dd if=/dev/urandom of="$URANDOM_SEED.new" bs="$pool_size" count=1 2> /dev/null
> +		cat "$URANDOM_SEED" "$URANDOM_SEED.new" 2>/dev/null | sha256sum | cut -d ' ' -f 1 > "$URANDOM_SEED"

    $ shellcheck package/urandom-scripts/S20urandom
    In package/urandom-scripts/S20urandom line 38:
                cat "$URANDOM_SEED" "$URANDOM_SEED.new" 2>/dev/null | sha256sum | cut -d ' ' -f 1 > "$URANDOM_SEED"
                    ^-------------^ SC2094: Make sure not to read and write the same file in the same pipeline.

> +		rm "$URANDOM_SEED.new"
>  		status=$?

This status now only gets the result of the 'rm', which is not very
interesting. I guess what we really need is whether the initial 'dd'
that extracts from the pool succeeded. If that fails, then we should
probably not update the saved seed, should we?

Here's what I suggest instead:

    save_random_seed() {
        printf 'Saving random seed: '
        status=1
        if touch "$URANDOM_SEED" 2> /dev/null; then
            old_umask=$(umask)
            umask 077
            dd if=/dev/urandom of="$URANDOM_SEED.tmp" bs="$pool_size" count=1 2> /dev/null
            new_seed_len="$(wc -c "$URANDOM_SEED.tmp" 2> /dev/null |cut -d ' ' -f 1)"
            if [ "$new_seed_len" -eq "$pool_size" ]; then
                cat "$URANDOM_SEED" "$URANDOM_SEED.tmp" 2>/dev/null \
                | sha256sum \
                | cut -d ' ' -f 1 > "$URANDOM_SEED.new"
                mv "$URANDOM_SEED.new" "$URANDOM_SEED"
                echo "OK"
                status=0
            else
                echo "FAIL"
            fi
            rm -f "$URANDOM_SEED.tmp"
            umask "$old_umask"
        else
            echo "SKIP (read-only file system detected)"
        fi
        return "$status"
    }

What do you think about that? Since this is a bit critical, I did not
want to just do that change when applying.

I do note that urandom should always return something, but this script
will also need to work on older kernels, sometimes way back to oldish
3.x series, and my recollection of how urandom worked back then is a bit
fuzzy. Are we sure it will always have returned enough? If so, then we
can ditch the sanity check altogether.

But then, if we failed to read anything from urandom, we'd just hash the
old seed, which should not decrease the entropy it had, as the hash has
the same size as the seed.

Thoughts?

Regards,
Yann E. MORIN.

>  		umask "$old_umask"
>  		if [ "$status" -eq 0 ]; then
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
