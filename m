From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 14:29:16 +0100
Subject: [Buildroot] [PATCH v2] package/pkg-kconfig: fix reconfigure for
 kconfig packages
In-Reply-To: <CA+_SqVZMB3yr9ALL-M4Wb9cX7FNGUVxEmM0b2d8=vszT+uN67g@mail.gmail.com>
References: <1574771063-29218-1-git-send-email-angelo@amarulasolutions.com>
 <20191126141838.74d804f8@windsurf>
 <CA+_SqVZMB3yr9ALL-M4Wb9cX7FNGUVxEmM0b2d8=vszT+uN67g@mail.gmail.com>
Message-ID: <20191126142916.1def6761@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Nov 2019 14:22:26 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> > Are you sure it was regressed ? When I read the code at commit
> > 4b81badbcc0b25678ac6627548160702731cf393, I don't see even back then
> > how linux-reconfigure would trigger a complete reconfiguration. Have
> > you actually verified that it was working as expected back at commit
> > 4b81badbcc0b25678ac6627548160702731cf393 ? Indeed, at commit
> > 4b81badbcc0b25678ac6627548160702731cf393, we were already only removing
> > the stamp_kconfig_fixup_done stamp file, so my understanding is rather
> > that commit 4b81badbcc0b25678ac6627548160702731cf393 doesn't implement
> > what the commit log says.  
> 
> Not tested that commit really, I guessed based on what the commit messages said.
> 
> I'll rework the commit message .

Instead of just reworking the commit message, I think it would instead
make sense to "git checkout 4b81badbcc0b25678ac6627548160702731cf393"
and test what was the behavior back then.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
