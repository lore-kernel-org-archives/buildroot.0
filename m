From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Oct 2016 15:40:13 +0200
Subject: [Buildroot] [PATCH] qt5webkit: fix building in Python 3
 environment
In-Reply-To: <1476451574-31822-1-git-send-email-yegorslists@googlemail.com>
References: <1476451574-31822-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20161014154013.231da448@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Oct 2016 15:26:14 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> qt5webkit requires Python for building stage and can be built with both
> Python 2 and 3. So remove the workaround with linking python binary and
> use Python dependency according to the selected Buildroot's Python
> version.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

This is pretty much reverting commit
ac16793eaaabfced0312420759e3a66cdaa1ea8e, which says that Python 3 on
the host doesn't work to build qt5webkit.

So if we apply your patch, I believe we will fall again into the
autobuilder issues that commit ac16793eaaabfced0312420759e3a66cdaa1ea8e
was fixing.

Can you explain why your patch is needed, and what now makes qt5webkit
build fine with Python 3 on the host ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
