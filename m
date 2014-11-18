From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 09:31:52 +0100
Subject: [Buildroot] [PATCH] pakage/erlang: fix host build without
 termcap (curses) library
In-Reply-To: <1416263596-11129-1-git-send-email-yann.morin.1998@free.fr>
References: <1416263596-11129-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141118093152.70fa0bd7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 17 Nov 2014 23:33:16 +0100, Yann E. MORIN wrote:

> Cc-ing Nathaniel, as all failures happen on his build server. Thomas and
> Nathaniel, could you please review the setting of that autobuild server?
> And the others as well?

We already discussed this on the mailing list some time ago.
Nathaniel's build server is the only one where libncurses-dev is not
installed in the system. And since libncurses-dev is not part of our
mandatory dependencies (someone could very well use gconfig or xconfig
only, for example), we thought that keeping Nathaniel's configuration
as is was a good way of catching the cases where we have a missing
dependency on host-ncurses.

I remember we even had a discussion to decide whether we should build
host-ncurses in such cases, or whether we should make libncurses-dev a
hard dependency of Buildroot, and Peter decided that building
host-ncurses was the right solution.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
