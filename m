From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 11 Nov 2014 15:32:03 +0000
Subject: [Buildroot] [PATCH] uclibc: respect top-level TARGET_CFLAGS
In-Reply-To: <545B7520.3000606@zacarias.com.ar>
References: <1415274442-24547-1-git-send-email-abrodkin@synopsys.com>
 <545B6E5F.5090406@zacarias.com.ar>
 <1415279058.11764.16.camel@abrodkin-8560l.internal.synopsys.com>
 <545B7520.3000606@zacarias.com.ar>
Message-ID: <1415719922.4122.27.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Thu, 2014-11-06 at 10:18 -0300, Gustavo Zacarias wrote:
> On 11/06/2014 10:04 AM, Alexey Brodkin wrote:
> 
> > Thanks for pointing to the existing bug.
> > 
> > In my particular case I need to tune uClibc for different HW
> > configurations.
> > 
> > By default uClibc will be built for most conservative case.
> > But we have an ability to use a particular HW accelerators - which is
> > done by passing option to GCC.
> 
> Then we could add a BR2_UCLIBC_EXTRA_CFLAGS string which defaults to ""
> and pass that to the uclibc's UCLIBC_EXTRA_CFLAGS.
> It was mentioned in the past IIRC, however it wasn't done because
> probably nobody felt the need for it since everybody was asking for that
> for consistency alone.
> Regards.

Makes sense. And I think I'll do a re-spin of my patch that implements
your suggestion.

Even though my intention was to completely align uClibc's flags with all
other binaries on target, probably it's enough to have this proposed
possibility to add manually set op option to uClibc in particular.

Still I think if any package gets broken due to some combination of
compiler options passed this is definitely a problem in either package
itself or toolchain. And either variant should be investigated and
properly fixed. Otherwise we introduce "robustness and predictability by
fixed setup" :)

-Alexey
