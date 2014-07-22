From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Jul 2014 07:20:35 -0300
Subject: [Buildroot] [RFC 1/3] Rename package mpc to libmpc
In-Reply-To: <53CE1F97.1020300@posteo.de>
References: <1405951937-21226-1-git-send-email-jkrause@posteo.de>	<1405951937-21226-2-git-send-email-jkrause@posteo.de>	<20140721162558.749a1393@free-electrons.com>	<53CD400B.1070106@zacarias.com.ar>
 <20140721201921.35334933@free-electrons.com> <53CE1F97.1020300@posteo.de>
Message-ID: <53CE3AF3.50606@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/22/2014 05:23 AM, J?rg Krause wrote:

Hello.

> okay, I understand that renaming is potentially problematic. But the
> package mpc is not a dependency for any package. gmp is a dependency for
> eight packages, and mpfr for one.
> 
> Looking at Debian, Arch, and Fedora, these packages are all named
> libmpc, libgmp, and libmpfr. I liked the idea of having consistent
> package names. And if I am searching for mpc in the menuconfig I find
> the multiprecision library as libmpc and the mpd client as mpc. So it's
> not to difficult to find the right package.

Well in gentoo mpfr is mpfr and so no, not prepended by lib since there
are categories which allows for duplicate naming.
The problem is if someone uses mpc in their custom packages, there's no
easy way of warning about the rename.

> There are dozen of clients for mpd. At least calling the package
> "mpclient" will show my the package when searching for "mpc" in the
> menuconfig.
> 
> Btw, is there any rule for duplicate names?

Yes that was the idea, mpclient doesn't sound right, but search works,
we could as well use mpcclient for example.
There's no rule for duplicates, best effort comes to mind.
Regards.
