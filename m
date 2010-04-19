From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 19 Apr 2010 19:50:45 +0200
Subject: [Buildroot] Still can't build working rootfs with crosstool-NG
	toolchain
In-Reply-To: <hqhq8e$uau$1@dough.gmane.org> (Grant Edwards's message of "Mon, 
	19 Apr 2010 14:44:30 +0000 (UTC)")
References: <hqhq8e$uau$1@dough.gmane.org>
Message-ID: <87d3xvcowa.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

Hi,

 Grant> Any ideas on why a rootfs built using a crosstool-ng toolchain
 Grant> wouldn't work?   In general how does one troubleshoot kernel panics
 Grant> like this?

I would start simple - Does a boot using init=/bin/sh work? If not, does
a simple hello world program run?

 Grant>  * buildroot specifies abi=apcs-gnu, ct-NG doesn't

That sounds suspicions. apcs-gnu is ARM OABI, are you sure you have
enabled that in CT-NG? Any reason why you are not using EABI?

-- 
Bye, Peter Korsgaard
