From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 23:22:15 +0100
Subject: [Buildroot] [PATCH] ubifs: Fix regression in ubifs_readdir()
In-Reply-To: <1477693395.31471.1.camel@embedded.rocks>
References: <1477648432-9543-1-git-send-email-richard@nod.at>
 <1477671544.8927.1.camel@embedded.rocks>
 <c542e099-0404-be8e-ebeb-d4265d3204d6@nod.at>
 <1477693395.31471.1.camel@embedded.rocks>
Message-ID: <20161101232215.5bf7cabd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello J?rg,

[E-mail thread hijacked from the linux-mtd mailing list, since there is
a Buildroot related problem reported.]

On Sat, 29 Oct 2016 00:23:15 +0200, J?rg Krause wrote:

> > > I'm not sure if it's related to the issue reported by Peter Rosin
> > > and
> > > Ralph Sennhauser, but I am still getting a kernel panic using UBIFS
> > > with OverlayFS on Linux v4.9.0-rc2 with this patch applied:  
> > 
> > Does reverting c83ed4c9dbb35 help?
> > And are you 100% sure you applied the fix?  
> 
> I double double checked. The fix was applied on the git tree, but the
> compiler cache (I am using Buildroot with this option enabled) fooled
> me by using an old copy. After disabling the compiler cache I got a
> fixed build of the kernel. The panic is gone! Thanks!

This is *really* bad. Which Buildroot version are you using? Are you
able to reproduce the bad ccache behavior here? A modified source code
should definitely lead to a different hash of the preprocessed code,
and therefore there shouldn't be such a confusion between two cache
results.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
