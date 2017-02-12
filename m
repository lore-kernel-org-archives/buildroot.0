From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Feb 2017 14:10:54 +0100
Subject: [Buildroot] [PATCH] infra/ccache: avoid color diagnostics with
 GCC older than v4.9
In-Reply-To: <20170212130803.GC11105@free.fr>
References: <1486733648-14658-1-git-send-email-casantos@datacom.ind.br>
 <20170211163845.71459758@free-electrons.com>
 <20170212100800.GC4533@free.fr>
 <20170212131443.155d5a7d@free-electrons.com>
 <20170212123326.GA11105@free.fr>
 <20170212135914.4a4a0fab@free-electrons.com>
 <20170212130803.GC11105@free.fr>
Message-ID: <20170212141054.3f8d6d55@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Feb 2017 14:08:03 +0100, Yann E. MORIN wrote:

> But we do a single build of ccache which gets used for both the target
> and host compiler. So if we patch ccache, we have to do if any of them
> if older than 4.9.
> 
> Which is not impossible, by far, but means that an older host gcc will
> disable colouring of the target gcc output, and vice-versa.

Correct, but it still seems better than failing completely.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
