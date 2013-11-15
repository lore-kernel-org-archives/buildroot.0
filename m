From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Nov 2013 00:08:14 +0100
Subject: [Buildroot] problem with building kernel modules.
In-Reply-To: <20131115205654.GH3337@free.fr>
References: <3FF194268D984DEF96AF81E6681E03E9@JohanW7>
 <20131115205654.GH3337@free.fr>
Message-ID: <20131116000814.29824043@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 15 Nov 2013 21:56:54 +0100, Yann E. MORIN wrote:

> The only option for you is to explicitly tell Buildroot to rebuild
> your module:
>     make fm25clxx-clean-for-reconfigure fm25clxx all

Or, more simply:

	make fm25clxx-reconfigure all

The "-clean-for-reconfigure" and "-clean-for-rebuild" are meant to be
internal targets. The ones that should be used are "-reconfigure" and
"-rebuild".

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
