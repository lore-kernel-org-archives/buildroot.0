From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 09:20:15 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: preserve ncurses progs/tools
In-Reply-To: <4e5df153-6f58-8b65-faf4-f87fb91324cd@mind.be>
References: <1492140047-60102-1-git-send-email-matthew.weber@rockwellcollins.com>
 <4e5df153-6f58-8b65-faf4-f87fb91324cd@mind.be>
Message-ID: <20170420092015.3b2f7fbd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Apr 2017 19:00:32 +0200, Arnout Vandecappelle wrote:

>  This is the correct approach I think. I think we could also do this for all the
> other cases where we have a -> busybox dependency just because they install the
> same apps.

Yes, I'm also wondering if it isn't better to disable the Busybox
applets (like Matt does in this patch for ncurses) rather then
overwriting the symlinks.

First of all, overwriting the symlinks means that if you "make
busybox-reinstall", you no longer get the right thing (for sure, we
never guarantee that partial builds/rebuilds give the correct output,
but it's nice when they do). And then of course, it means that there is
code in Busybox, consuming some space, that is never used.

The only annoyance that I can see is a potential blotification of
busybox.mk, with lots of conditional for various packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
