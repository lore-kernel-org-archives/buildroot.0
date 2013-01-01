From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Jan 2013 10:26:06 +0100
Subject: [Buildroot] [PATCH 1/3] system/skeleton: add the shadow-group
 file
In-Reply-To: <201212311918.08866.yann.morin.1998@free.fr>
References: <cover.1356909238.git.yann.morin.1998@free.fr>
 <3633f72d3f35d4413bec319971b1a8d26c2fbaeb.1356909238.git.yann.morin.1998@free.fr>
 <20121231181824.3f82197f@skate>
 <201212311918.08866.yann.morin.1998@free.fr>
Message-ID: <20130101102606.258d780e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

Happy New Year!

On Mon, 31 Dec 2012 19:18:08 +0100, Yann E. MORIN wrote:

> Wrong. Groups can have passwords. And users can change-group with:
> 
>     $ newgrp [-] groupname
> 
> If the user is a member of that group, or the group is paswrod-less, then
> no password is asked for, and the current group-id has changed (it is a bit
> like 'su', but to just change group)
> 
> If the user is not a member that group, and the group is not restricted (eg.
> password is not '*' and does not start with '!', then the user is asked to
> enter the group password.
> 
> See:
>     group(5) gshadow(5) newgrp(1)
> 
> I hope that was enough to explain addition of gshadow. ;-)

Interesting, I didn't know about this.

The next question that comes up is: do we really need to support this
in Buildroot?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
