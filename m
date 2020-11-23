From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Nov 2020 13:20:20 +0100
Subject: [Buildroot] [PATCH RESEND] package/icu: bump to version 68-1
In-Reply-To: <20201123100751.4095539-1-heiko@sntech.de> (Heiko Stuebner's
 message of "Mon, 23 Nov 2020 11:07:51 +0100")
References: <20201123100751.4095539-1-heiko@sntech.de>
Message-ID: <87y2istgcb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Stuebner <heiko@sntech.de> writes:

 > From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
 > This includes the fix [0] for CVE-2020-10531 .

 > [0] https://github.com/unicode-org/icu/commit/b7d08bc04a4296982fcef8b6b8a354a9e4e7afca

 > Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
 > ---
 > I'm not sure if I did something wrong in the initial submission,
 > but so far got no response at all, so am including some more
 > people who recently committed changes to icu.

 > As this fixes a CVE, I guess this might need some sort of priority.

There is quite some pending patches. It would be good to explicitly mark
it as a security fix, E.G. 'package/icu: security bump to version 68-1',
to make sure it isn't missed for master, as package bumps otherwise now
only go to next as we are busy getting 2020.11 stablized and released.

How much have you tested this? New icu releases unfortunately have a
tendency to cause various breakage? Would it be an option to backport
this fix to the 67-1 release for 2020.11 / 2020.02 and only bump to 68-1
for next?

-- 
Bye, Peter Korsgaard
