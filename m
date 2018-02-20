From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 20 Feb 2018 15:46:46 +0000
Subject: [Buildroot] __mcount on ARC
In-Reply-To: <f0f25d75-38f2-8587-61a8-76bf0259247f@gmail.com>
References: <8e90a87a-7e64-6662-3309-ce0325bc686f@gmail.com>
 <20180219090939.1f050545@windsurf.lan>
 <1519030700.14718.9.camel@synopsys.com>
 <f0f25d75-38f2-8587-61a8-76bf0259247f@gmail.com>
Message-ID: <1519141605.6393.78.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Zoltan,

On Mon, 2018-02-19 at 21:02 +0100, Zoltan Gyarmati wrote:
> Dear All
> On 02/19/2018 09:58 AM, Alexey Brodkin wrote:
> > Hi Zoltan,
> > 
> > On Mon, 2018-02-19 at 09:09 +0100, Thomas Petazzoni wrote:
> > > Hello,

[snip]
 
> Thanks for the background info!
> According to the gprof documentation [1]:
> 
> "which causes every function to call mcount (or _mcount, or __mcount, depending on the OS and compiler) as one of its first operations."
> 
>  And a couldn't find any note about difference between the 3 so it seems we are safe to assume that these are the same. 
> Is there any intention to patch the ARC glibc in Buildroot with the mentioned strong_alias (or at later point even the upstream source tree?)
> Any opinions?
> 
> 
> [1] https://sourceware.org/binutils/docs/gprof/Implementation.html

Keeping in mind your input I really think it worth addressing in glibc for ARC.
And given our port was not yet upstreamed maybe we may squeeze that approach with
an alias as on AArch64 into the next respin of Vineet's patches and we'll
just get new set of patches on top of the most recent glibc in Buildroot.

Or as a short-term solution just to get rid of that build failure right before
Buildroot release we may just hand-copy "strong_alias (__mcount, _mcount);" in
sysdeps/arc/machine-gmon.h.

Which option do you prefer?

-Alexey
