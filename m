From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 19 Apr 2010 18:13:47 +0000 (UTC)
Subject: [Buildroot] Still can't build working rootfs with crosstool-NG
	toolchain
References: <hqhq8e$uau$1@dough.gmane.org> <87d3xvcowa.fsf@macbook.be.48ers.dk>
Message-ID: <hqi6gr$i2c$2@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-04-19, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:
>
> Grant> Any ideas on why a rootfs built using a crosstool-ng toolchain
> Grant> wouldn't work?   In general how does one troubleshoot kernel panics
> Grant> like this?
>
> I would start simple - Does a boot using init=/bin/sh work? If not,
> does a simple hello world program run?
>
> Grant>  * buildroot specifies abi=apcs-gnu, ct-NG doesn't
>
> That sounds suspicions. apcs-gnu is ARM OABI, 

Indeed, that was the issue.  I mistakenly thought my kernel was EABI,
and that both my toolchains were EABI, and didn't realize that
apcs-gnu meant ARM OABI.

> are you sure you have enabled that in CT-NG?
> Any reason why you are not using EABI?

I starting using a default config from Atmel that was OABI.  I 
switched to EABI, but at some point had switched back (and either
didn't know or forgot).

Everything really is EABI now, and things are working again.

-- 
Grant Edwards               grant.b.edwards        Yow! Did I SELL OUT yet??
                                  at               
                              gmail.com            
