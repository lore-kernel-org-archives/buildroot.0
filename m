From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 06 Nov 2014 10:18:24 -0300
Subject: [Buildroot] [PATCH] uclibc: respect top-level TARGET_CFLAGS
In-Reply-To: <1415279058.11764.16.camel@abrodkin-8560l.internal.synopsys.com>
References: <1415274442-24547-1-git-send-email-abrodkin@synopsys.com>	
 <545B6E5F.5090406@zacarias.com.ar>
 <1415279058.11764.16.camel@abrodkin-8560l.internal.synopsys.com>
Message-ID: <545B7520.3000606@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/06/2014 10:04 AM, Alexey Brodkin wrote:

> Thanks for pointing to the existing bug.
> 
> In my particular case I need to tune uClibc for different HW
> configurations.
> 
> By default uClibc will be built for most conservative case.
> But we have an ability to use a particular HW accelerators - which is
> done by passing option to GCC.

Then we could add a BR2_UCLIBC_EXTRA_CFLAGS string which defaults to ""
and pass that to the uclibc's UCLIBC_EXTRA_CFLAGS.
It was mentioned in the past IIRC, however it wasn't done because
probably nobody felt the need for it since everybody was asking for that
for consistency alone.
Regards.
