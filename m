From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 6 Nov 2014 13:04:19 +0000
Subject: [Buildroot] [PATCH] uclibc: respect top-level TARGET_CFLAGS
In-Reply-To: <545B6E5F.5090406@zacarias.com.ar>
References: <1415274442-24547-1-git-send-email-abrodkin@synopsys.com>
 <545B6E5F.5090406@zacarias.com.ar>
Message-ID: <1415279058.11764.16.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Thu, 2014-11-06 at 09:49 -0300, Gustavo Zacarias wrote:
> On 11/06/2014 08:47 AM, Alexey Brodkin wrote:
> 
> > When BR2_TARGET_OPTIMIZATION is used (with some specific compiler flags)
> > it's expected that ALL target binaries will be built with specified options.
> > 
> > Currently uClibc is built with its own set of options.
> > This change allows passing additional flags to uclibc build system.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> 
> This was rejected before:
> https://bugs.busybox.net/show_bug.cgi?id=5294
> 
> And i'm back to my original question, what's the specific need for this?
> Even for eglibc/glibc we force -O2 for example.
> If there's a very valid (like, it breaks!) reason for this we can look
> for a way to address it, but as-is i say NAK.
> If you look at uClibc's Rules.mak file you'll see there are lots of
> OPTIMIZATION/CPU_CFLAGS (and other) conditionals that could be undone by
> this and lead to unexpected results.
> Regards.
> 

Thanks for pointing to the existing bug.

In my particular case I need to tune uClibc for different HW
configurations.

By default uClibc will be built for most conservative case.
But we have an ability to use a particular HW accelerators - which is
done by passing option to GCC.

-Alexey
