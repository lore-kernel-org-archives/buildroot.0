From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 May 2016 14:55:35 +0200
Subject: [Buildroot] wireless_tools and ifrename
In-Reply-To: <BE7DD8D2CBE7B241971A69A3E62C11B70118903F@partis.dyndns.org>
References: <BE7DD8D2CBE7B241971A69A3E62C11B70118903F@partis.dyndns.org>
Message-ID: <20160530145535.0bad0351@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 May 2016 16:08:01 +0100, Gary Partis wrote:

> I am curently using buildroot-2016.02, targeting a PC-type system, and
> have wireless-tools (and associated "install shared library") enabled.
>  
> The binaries such as iwconfig, iwspy etc etc are built and are present
> on the target.
>  
> However, the binary "ifrename" is not built; and no warning or error is
> emitted. Why?
>  
> Am I missing something really obvious? Is there a dependancy not set
> correctly?

It seems to be a limitation of our wireless_tools package, which only
builds the "iw multi call" binary. You can tweak wireless_toolks.mk so
that it also builds ifrename. If that works for you, don't forgot to
send a patch!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
