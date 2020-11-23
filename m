From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Date: Mon, 23 Nov 2020 15:25:56 +0100
Subject: [Buildroot] [PATCH RESEND] package/icu: bump to version 68-1
In-Reply-To: <87y2istgcb.fsf@dell.be.48ers.dk>
References: <20201123100751.4095539-1-heiko@sntech.de>
 <87y2istgcb.fsf@dell.be.48ers.dk>
Message-ID: <2714898.iCvar5HTIS@diego>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Am Montag, 23. November 2020, 13:20:20 CET schrieb Peter Korsgaard:
> >>>>> "Heiko" == Heiko Stuebner <heiko@sntech.de> writes:
> 
>  > From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
>  > This includes the fix [0] for CVE-2020-10531 .
> 
>  > [0] https://github.com/unicode-org/icu/commit/b7d08bc04a4296982fcef8b6b8a354a9e4e7afca
> 
>  > Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
>  > ---
>  > I'm not sure if I did something wrong in the initial submission,
>  > but so far got no response at all, so am including some more
>  > people who recently committed changes to icu.
> 
>  > As this fixes a CVE, I guess this might need some sort of priority.
> 
> There is quite some pending patches. It would be good to explicitly mark
> it as a security fix, E.G. 'package/icu: security bump to version 68-1',
> to make sure it isn't missed for master, as package bumps otherwise now
> only go to next as we are busy getting 2020.11 stablized and released.
> 
> How much have you tested this? New icu releases unfortunately have a
> tendency to cause various breakage? Would it be an option to backport
> this fix to the 67-1 release for 2020.11 / 2020.02 and only bump to 68-1
> for next?

This is running on a device we're doing right now as part of qt5 and a qt5
main application for a week now (on a buildroot 2020.05-base) and I didn't
hear about any specific hickups so far.

But while re-researching the CVE I noticed that it (now) marks 66.1 as up-to
affected - I do remember reading 67.1 there [0] before, though don't have
proof that it's not just my eyes ;-) .

So the 67.1 in buildroot is actually secure and doesn't need an update.

So I'll re-send this as v2 without the security-related text then ;-) .


Heiko


[0] https://nvd.nist.gov/vuln/detail/CVE-2020-10531
