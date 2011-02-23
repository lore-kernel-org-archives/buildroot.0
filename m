From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Feb 2011 23:37:16 +0100
Subject: [Buildroot] [PATCH v2] makedevs: fix cases where (start != 0)
In-Reply-To: <4D653979.7090007@gmail.com> (Thomas De Schampheleire's message
	of "Wed, 23 Feb 2011 17:44:41 +0100")
References: <4D63E496.8020704@gmail.com> <87tyfvn1lm.fsf@macbook.be.48ers.dk>
	<AANLkTim5v30bAeJ=H_TZ1N=ze6UaFh4MnsURchwQ-=_B@mail.gmail.com>
	<4D653979.7090007@gmail.com>
Message-ID: <87fwrextr7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> The makedevs script did not always generate the requested set
 Thomas> of device names / minor number series.  * If start != 0, then
 Thomas> requesting (count) devices would generate only (count - start)
 Thomas> * If start != 0 && increment != 1, then requesting minors
 Thomas> starting with (minor) would generate minors starting with
 Thomas> (minor + (start * (increment - 1)))

 Thomas> This patch fixes the code and updates the usage text with extra
 Thomas> examples.

Committed, thanks.

-- 
Bye, Peter Korsgaard
