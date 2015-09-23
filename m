From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Sep 2015 15:12:40 +0200
Subject: [Buildroot] [PATCH] rtptools: needs RPC support
In-Reply-To: <5602A3F7.9000605@imgtec.com>
References: <1443009479-8481-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150923150354.70f6b27a@free-electrons.com>
 <5602A3F7.9000605@imgtec.com>
Message-ID: <20150923151240.31f5d864@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Sep 2015 14:07:03 +0100, Vicente Olivert Riera wrote:

> > I'm surprised we have not seen autobuilder failures. Or did you forget
> > to include a reference to an autobuilder error?
> 
> No, I didn't forget that. I have catch this issue with one local
> autobuilder I have. If you wonder why I have a local autobuilder instead
> of submitting the results to the ML, it's because that autobuilder uses
> toolchains that are not yet included in our Buildroot tree.

That's perfectly OK. However, I wonder why we haven't seen this problem
with toolchains already tested in the autobuilders. rtptools does not
have any other dependencies, and we have a "basic" toolchain with no
special options enabled.

Also, I think your patch should instead be:

	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC

and add libtirpc to the dependencies.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
