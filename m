From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Mar 2012 09:57:47 +0100
Subject: [Buildroot] [PATCH] pkg-infra: use ?= instead of ifdef
In-Reply-To: <1332113334-20119-1-git-send-email-arnout@mind.be>
References: <1332113334-20119-1-git-send-email-arnout@mind.be>
Message-ID: <20120319095747.4b571e8f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon, 19 Mar 2012 00:28:54 +0100,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> ifdef considers a variable undefined if it is defined as empty.  In the
> GENTARGETS/AUTOTARGETS/CMAKETARGETS infrastructure, the ifdef construct
> is often used to default to the value from the target-variable if the
> host-variable is not defined.  However, this makes it impossible to
> override the host-variable as empty.  Therefore, use ?= instead to assign
> the defaults.

Could you share a specific example on why this would be useful? I'm
sure there are uses cases, but I'm curious about the one you're having.

> I didn't touch the _VERSION infrastructure because I'm afraid to break it.
> In fact, I think it already is broken (I don't see how that /-to-_
> substitution can work for host-packages).

Not sure I understand what is broken here. What does "/-to-_" means?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
