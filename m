From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 12:39:36 +0100
Subject: [Buildroot] [PATCH] glibc: ARC is now supported via patches
In-Reply-To: <20171109215821.16615-1-abrodkin@synopsys.com>
References: <20171109215821.16615-1-abrodkin@synopsys.com>
Message-ID: <20180101123936.609b7f41@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Nov 2017 00:58:21 +0300, Alexey Brodkin wrote:
> Given ARC port is just a very few patches away from upstream
> and if those are based on 2.29 everything works like a charm
> let's forget about SNPS GitHub stuff and use vanilla glibc
> plus patches.
> 
> This among other things solves a problem with stable fixes for glibc.
> Now when Buildroot switched to the tip of glibc's stable branch instead of
> applying cherry-picked patches ARC version would stay behind every time
> glibc's "version" gets updated in Buildroot.
> 
> But if we just apply ARC patches then we're good with whatever commit
> from upstream stable branch is taken.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/glibc/0001-longlong.h-sync-from-gcc.patch  |  133 +
>  .../0002-ARC-add-definitions-to-elf-elf.h.patch    |   94 +
>  package/glibc/0003-ARC-Initial-port-to-glibc.patch | 7625 ++++++++++++++++++++

This is a bit too much feature patches IMO, it's a complete
architecture port. I agree it's a backport from upstream, so it's not
too bad. But since glibc 2.27, which includes this, is expected to be
released on February 1st, I prefer to post-pone this change until glibc
2.27 gets released and we move to it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
