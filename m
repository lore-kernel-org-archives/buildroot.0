From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 13 Mar 2021 19:24:12 +0100
Subject: [Buildroot] [PATCH 2020.02.x] package/redis: security bump to
 version 5.0.11 (CVE-2021-21309)
In-Reply-To: <874khf3uo9.fsf@dell.be.48ers.dk>
References: <20210309112303.28379-1-patrickdepinguin@gmail.com>
 <874khf3uo9.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LX3OF1Eoj2k_xth84S1PGOX5jg+U51SDFdnsEEYKGHBmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 13, 2021, 17:06 Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com>
> writes:
>
>  > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>  > References:
>  > https://github.com/redis/redis/security/advisories/GHSA-hgj8-vff2-7cjf
>  > https://nvd.nist.gov/vuln/detail/CVE-2021-21309
>
>  > "Impact:
>
>  >     An integer overflow bug in 32-bit Redis version 4.0 or newer could
> be
>  >     exploited to corrupt the heap and potentially result with remote
> code
>  >     execution.
>
>  >     Redis 4.0 or newer uses a configurable limit for the maximum
> supported
>  >     bulk input size. By default, it is 512MB which is a safe value for
> all
>  >     platforms.
>
>  >     If the limit is significantly increased, receiving a large request
> from
>  >     a client may trigger several integer overflow scenarios, which would
>  >     result with buffer overflow and heap corruption. We believe this
> could
>  >     in certain conditions be exploited for remote code execution.
>
>  >     By default, authenticated Redis users have access to all
> configuration
>  >     parameters and can therefore use the ?CONFIG SET
> proto-max-bulk-len? to
>  >     change the safe default, making the system vulnerable.
>
>  >     This problem only affects 32-bit Redis (on a 32-bit system, or as a
>  >     32-bit executable running on a 64-bit system).
>
>  > Patches
>
>  >     The problem is fixed in version 6.2, and the fix is back ported to
>  >     6.0.11 and 5.0.11. Make sure you use one of these versions if you're
>  >     running 32-bit Redis.
>  > "
>
>  > Signed-off-by: Thomas De Schampheleire <
> thomas.de_schampheleire at nokia.com>
>  > ---
>
>  > NOTE: this only applies to 2020.02.x.
>  > - For 2020.11.x a bump to 6.0.11 or later is needed (e.g. backport
> commit cbd5f7e3a9331).
>  > - For 2021.02, 6.0.12 is used which already contains the fix.
>
> Committed to 2020.02.x after updating to 5.0.12 as pointed out by
> Titouan, thanks.
>

Thanks Peter and Titouan, and sorry for not having responded yet!

Best regards
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210313/09b360c6/attachment.html>
