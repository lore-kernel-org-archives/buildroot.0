From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Apr 2015 16:18:25 +0200
Subject: [Buildroot] [PATCH 1/1] ncurses: generate libtermcap
In-Reply-To: <1429880066-7743-1-git-send-email-pascal.mazon@6wind.com>
References: <1429880066-7743-1-git-send-email-pascal.mazon@6wind.com>
Message-ID: <20150424161825.4d76c287@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Pascal Mazon,

On Fri, 24 Apr 2015 14:54:26 +0200, Pascal Mazon wrote:
> There is no libtermcap package in buildroot, but ncurses implements termcap
> natively. Furthermore, ncurses already provides the termcap.h header file.
> 
> With this patch, we fix an issue encountered with some external toolchains
> that include a libtermcap.a (typically the GNU libtermcap version) in their
> sysroot folder.

Which external toolchains are in this situation?

> Bash, for instance, would be linking with this libtermcap while using
> headers from ncurses.
> 
> In order to be consistent, let's make sure there is only the ncurses'
> termcap library. To that effect, we:
> - remove any libtermcap.* in the staging dir,

I think this should probably not be done by the ncurses package, but as
a post-install hook of the external toolchain.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
