From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Dec 2017 10:08:53 +0100
Subject: [Buildroot] [PATCH] traceroute: new package
In-Reply-To: <874loqgxb7.fsf@dell.be.48ers.dk>
References: <1513429309-16761-1-git-send-email-sergio.prado@e-labworks.com>
 <20171216160636.028739fe@windsurf>
 <874loqgxb7.fsf@dell.be.48ers.dk>
Message-ID: <20171217100853.4d3916bb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Dec 2017 22:47:08 +0100, Peter Korsgaard wrote:

> Yes, but plain cp follows symlinks, so it ends up overwriting the
> bin/busybox binary, breaking the build.
> 
> So we either need this workaround or pass INSTALL=$(INSTALL) to make to
> get it to use install instead of cp.

Good point. I've pushed a change that passes INSTALL=$(INSTALL), I've
verified that it fixes the issue. Thanks for spotting this!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
