Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A46C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 08:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B490C40B73;
	Wed, 23 Mar 2022 08:44:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7FBKga56lPtq; Wed, 23 Mar 2022 08:44:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA8A940291;
	Wed, 23 Mar 2022 08:44:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C97841BF425
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 08:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B742B612DF
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 08:44:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M8jpqDrHeiEy for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 08:44:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43164612DE
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 08:44:21 +0000 (UTC)
Received: from [192.168.0.175] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N6bTa-1o8guc0jgU-0186gM; Wed, 23 Mar 2022 09:44:16 +0100
Message-ID: <3211011a-129a-da72-a359-75bd72c7ad4b@green-communications.fr>
Date: Wed, 23 Mar 2022 09:43:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: fr
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, buildroot@buildroot.org
References: <20220323035233.140997-1-Jason@zx2c4.com>
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <20220323035233.140997-1-Jason@zx2c4.com>
X-Provags-ID: V03:K1:YTSuUXYxnuckNMlzGYl2nz7OZcgPqKMYR/MOuQxuV1okgahjWsO
 u68s1qUxJpTfOUivzM45YA7XscukAM3pjb2uTPYbCLAcK7FIRlMlhP7bn6DOALIi+S2PDkA
 R6G56B6+4LIOHuh+TG08V013yP7gndWe8DweDpSxNT+GCkvs/ZXg/Lbp0FZ/H7umvn8Rv04
 n0kPEc8fPzmTwJ86ezS3g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6RJQN3A/66E=:I+CNuayp0f/gKKm8qUx+Ze
 yqgZnj6ZRRuReIinTh1EplFg7WrxZTr6AuISIjnYT52wGh/Kgq7sbf/F1gLPQRr+JEHBFRMi1
 duZDn4O/EGX6YjymtYUUi/M+osZeLTcGZOu1ZNRkdzthoRVg9VW+i/vM+tle1MISFxz5JsA6A
 /qhGPJikAQfVqVB4udmef2IWTHcarbTRDA/q4LsFR8v0MS1+KD6ZdhbTTiz/E2TBOtW2+hmDk
 mpiGABMZ+n3qiDBoHYS65EtPYP021AYrymg7tF7rN1kAyU60EXaBr6t+9Y5orP+IKuWW66+sT
 32AjZ0Uu+nWQ7+VtrC5Oj4Pfk+2TRILR9M/ve7pFBtAzZWM+In3QYDYWA8K+aUheUKcwDMiDx
 Aj2pNSkEg0QUunVknIM1GTrlhjssmm+qXAoVEvTLu03NT/JNSXRxIIPsZroZ/B8zSZDrrkOHH
 Qk5i0sVMDaAEpQsrdZMfJcqNGoNbJEBd9G8yeTArldw2TQBIV+yhrCAm+smPhjMGgJ4ljmWP4
 XJ7/fvbbeYwHbuvidRleaGbDGDHi08TwiVtdb9hfFw7AGuG8ZnXwMH6tx23hwfjvx1XyG7SG9
 9ruEmNYACAxG7zrzA03ImlLwqgskGbps9uMo1SDocamRCsRUL8MShl4VdWuT1lbyLzUBhDLUh
 MNEh+6UT4oln3b9iKfN4h6xGMSFbrY/pPREMkGXqWHbSBxklNjMp9r44hRTLjJ2tUhRBBYQTv
 13GoOtR3Snsva9TINFu6XM8mc9pinBKiTesm2Q==
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 23/03/2022 04:52, Jason A. Donenfeld wrote:
> Writing into /dev/urandom doesn't actually credit any entropy bits. And
> while it adds that data to the entropy pool, it won't actually be
> immediately used when reading from /dev/urandom subsequently. This is
> how the kernel's /dev/urandom has always worked, unfortunately.
> 
> As a result of this behavior, which may be understandably surprising to
> you, writing a good seed file into /dev/urandom and then saving a new
> seed file immediately after is dangerous, because the new seed file may
> wind up being entirely deterministic, even if the old seed file was
> quite good.
> 
> I fixed this in systemd with
> <https://github.com/systemd/systemd/commit/da2862ef06f22fc8d31dafced6d2d6dc14f2ee0b>,
> and fortunately it's possible to do the same thing in shell script here.
> Specifically, instead of just saving new /dev/urandom output straight
> up, we hash the new /dev/urandom together with the old seed, in order to
> produce the new seed. This way the amount of entropy in the new seed
> will stay the same or get better, but not appreciably regress.
> 
> At the same time, the pool size check in this script is useless. Writing
> to /dev/urandom never credits bits anyway, so no matter what, writing
> into /dev/urandom is useful and not harmful. There's also not much of a
> point in seeding with more than 256 bits, which is what the hashing
> operation above produces. So this commit removes the file size check.
> 
> As a final note, while this commit improves upon the status quo by
> removing a vulnerability, this shell script still does not actually
> initialize the RNG like it says it does. For initialization via a seed
> file, the RNDADDENTROPY ioctl must be used.
> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>   package/urandom-scripts/S20urandom | 30 +++++++++++-------------------
>   1 file changed, 11 insertions(+), 19 deletions(-)
> 
> diff --git a/package/urandom-scripts/S20urandom b/package/urandom-scripts/S20urandom
> index e4fd125721..f971ea905a 100644
> --- a/package/urandom-scripts/S20urandom
> +++ b/package/urandom-scripts/S20urandom
> @@ -17,26 +17,16 @@ else
>   	pool_size=512
>   fi
>   
> -check_file_size() {
> -	[ -f "$URANDOM_SEED" ] || return 1
> -	# Try to read two blocks but exactly one will be read if the file has
> -	# the correct size.
> -	size=$(dd if="$URANDOM_SEED" bs="$pool_size" count=2 2> /dev/null | wc -c)
> -	test "$size" -eq "$pool_size"
> -}
> -
>   init_rng() {
> -	if check_file_size; then
> -		printf 'Initializing random number generator: '
> -		dd if="$URANDOM_SEED" bs="$pool_size" of=/dev/urandom count=1 2> /dev/null
> -		status=$?
> -		if [ "$status" -eq 0 ]; then
> -			echo "OK"
> -		else
> -			echo "FAIL"
> -		fi
> -		return "$status"
> +	printf 'Initializing random number generator: '
> +	dd if="$URANDOM_SEED" bs="$pool_size" of=/dev/urandom count=1 2> /dev/null

This will fail if the seed does not exist.  Either because it's the 
first boot or because the system is read-only.

The [ -f ] test is still useful in the first case, because init_rng must 
return 0 for save_random_seed to be called during boot. And if 
save_random_seed is not called during boot the seed might never be 
created (you cannot expect stop to be called).

> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
>   	fi
> +	return "$status"
>   }
>   
>   save_random_seed() {
> @@ -44,7 +34,9 @@ save_random_seed() {
>   	if touch "$URANDOM_SEED" 2> /dev/null; then
>   		old_umask=$(umask)
>   		umask 077
> -		dd if=/dev/urandom of="$URANDOM_SEED" bs="$pool_size" count=1 2> /dev/null
> +		dd if=/dev/urandom of="$URANDOM_SEED.new" bs="$pool_size" count=1 2> /dev/null
> +		cat "$URANDOM_SEED" "$URANDOM_SEED.new" 2>/dev/null | sha256sum | cut -d ' ' -f 1 > "$URANDOM_SEED"
> +		rm "$URANDOM_SEED.new"
 >   		status=$?

This breaks the error check.  Either these commands must be chained by 
&& or each of them should be tested.

Also, i'm not sure why stderr is supressed for cat.  In this case it is 
not supposed to fail or print anything to stderr.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
