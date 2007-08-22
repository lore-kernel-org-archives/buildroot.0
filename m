From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 22 Aug 2007 23:25:04 +0200
Subject: [Buildroot] Hiding non-buildable packages
In-Reply-To: <200708222317.35411.yann.morin.1998@anciens.enib.fr>
References: <1187728137.6145.48.camel@86-115-11-152>
	<200708222244.38319.yann.morin.1998@anciens.enib.fr>
	<1187816364.4321.63.camel@86-115-11-28>
	<200708222317.35411.yann.morin.1998@anciens.enib.fr>
Message-ID: <20070822212504.GD11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 22, 2007 at 11:17:35PM +0200, Yann E. MORIN wrote:
>On Wednesday 22 August 2007 22:59, Ulf Samuelsson wrote:
>> Granted, but do we need it to be perfect?, I think not!
>> I know that openssh does not work due to lack of 64 bit math.
>> I do not think it works for any architecture.
>> Why should every newbie try this out for themseleves,
>> only to find that it does not build...
>> Much better to hide it from the build, and then let the guy
>> which really wants it to reenable and debug it.
>
>The problem with your suggestion, if I may, is that it becomes quite complex
>to maintain.

Yes, this is nonsense and we will simply not do that but strive to
maximize our working set.

Ulf, that's exactly the reason why -- up until recently -- didn't add
any random package some single person wanted to use. Keep in mind that
*you* have to _actively_ maintain the packages you add, or at least try
to, to the best of your knowledge/time.
>
>I'd rather have something much simpler, should we do want to add such options:
>
>config MAYBE_BROKEN
>    bool

false
Stiff should work, ideally. The default _has_ to work, about anything
else could be broken anytime. If it's broken, then fix it, if you need
it, else turn it off. That simple.
