From: John O'Sullivan <John.OSullivan@BlackBox.com>
Date: Fri, 10 Nov 2017 13:43:49 +0000
Subject: [Buildroot] Regenerating Skeleton without a clean in 2017
In-Reply-To: <20171110144156.6c2a8295@windsurf>
References: <eff7c8c514764b54a3a11924db80c3bb@PGHPRDEXCH02.corp.bbns.com>
 <20171110144156.6c2a8295@windsurf>
Message-ID: <e9d73bb32de64fb9a705c0a3365bf8fb@PGHPRDEXCH02.corp.bbns.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for the reply, we use it largely for historical reasons, I will check out the root filesystem overlay as you suggest

Regards
John

-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
Sent: 10 November 2017 13:42
To: John O'Sullivan
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] Regenerating Skeleton without a clean in 2017

Hello,

On Fri, 10 Nov 2017 13:17:15 +0000, John O'Sullivan wrote:

> In the older buildroot releases  one could force a reintegration of a
> skeleton overlay with various hacks like removing the .root file in
> build, are there any equivalents in Buildroot-2017.02-4. I understand
> this is not best practice but I have some quick prototyping to do and
> the build time is an issue.

$ make skeleton-rebuild

should do the trick in Buildroot 2017.02. Starting with 2017.08, this won't work as the skeleton has been split into several packages.

However, you should stop using a custom skeleton, and use a root filesystem overlay instead (perhaps with a post build script). Why do you still use a custom skeleton ?

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

________________________________

This email and any files transmitted with it are confidential and are intended for the sole use of the individual to whom they are addressed. Black Box Corporation reserves the right to scan all e-mail traffic for restricted content and to monitor all e-mail in general. If you are not the intended recipient or you have received this email in error, any use, dissemination or forwarding of this email is strictly prohibited. If you have received this email in error, please notify the sender by replying to this email.
