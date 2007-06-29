From: Ben Dooks <ben@fluff.org>
Date: Fri, 29 Jun 2007 10:31:51 +0100
Subject: [Buildroot] ARM EABI builds
In-Reply-To: <468459AE.40807@gmail.com>
References: <002a01c7b9be$22a79000$7100a8c0@SDW>
	<20070628230131.GJ4096@aon.at> <468459AE.40807@gmail.com>
Message-ID: <20070629093151.GC3856@trinity.fluff.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 28, 2007 at 06:00:30PM -0700, Tom wrote:
> 
> 
> 
> Bernhard Fischer wrote:
> > On Thu, Jun 28, 2007 at 03:54:22PM -0400, Stuart Wood wrote:
> >> Just a note on what Tom said about user land application. I've already 
> > 
> > Just as a note on what everybody seems to say about configuring GCC:
> > It is very amusing that you guys seem to be excited about _not_ setting
> > a config option -- CONFIG_BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS -- which
> > is specifically exported to you, to spell out specific requirements put
> > upon gcc (other toolchain parts of course also provide said means for
> > hand-crafted  options, mind you).
> 
> Speaking for myself, I am not excited about any particular option. Also 
> I don't need a doctor for this anymore, as for my part it works. Now.
> 
> However, as the combination EABI and ARM9 seems to be popular, I thought 
> it would be nice to save others some of this trouble that they are bound 
> to run into (*), either by just mentioning the option or by setting it 
> automatically in buildroot. If you are saying that 
> CONFIG_BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS is better suited for the 
> required target CPU option than BR2_EXTRA_GCC_CONFIG_OPTIONS, that could 
> very well be.
> 
> (*) This is the error I got after kernel boot on ARM920T/EABI default 
> config, w/o the required CPU option:
> init (1): undefined instruction: pc=00008c60

That is interesting, because I haven't been getting that when my
system fails. I'll check the setup of /dev/console and the /dev
entries for the serial ports. This would have been very helpful in
pointing out the problem. 

As an aside, it would be possible to fix the instruction in the
kernel's undefined instruction trap (as is done to emulate the
old hardware floating point instructions on newer processors) but
I personally feel that this is something the kernel should not
have to be doing.

[snip]

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
