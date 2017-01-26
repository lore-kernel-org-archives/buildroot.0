From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Jan 2017 21:55:05 +1300
Subject: [Buildroot] [V3 1/1] sngrep: new package
In-Reply-To: <20170125145446.23466-1-aduskett@codeblue.com>
References: <20170125145446.23466-1-aduskett@codeblue.com>
Message-ID: <20170126215505.1334a8ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Jan 2017 09:54:46 -0500, Adam Duskett wrote:
> sngrep is a tool for displaying SIP calls message flows from terminal.
> It supports live capture to display realtime SIP packets and can also
> be used as PCAP viewer.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>

I've applied, but after doing quite a few changes:

    [Thomas:
     - ncurses wide char and other sub-options are not needed to build
       sngrep, so they are removed, as well as the wchar
       dependency. ncurses with wchar support is only needed when
       --enable-unicode is passed, but even then, it doesn't work because
       the configure script searches <ncursesw/ncurses.h>, so unicode
       support has been explicitly disabled.
     - add optional dependencies on OpenSSL, GnuTLS and PCRE. This also
       makes sure they are explicitly enabled/disabled depending on the
       configuration.
     - add upstream URL in Config.in file.]

In a follow-up commit, I also added you in the DEVELOPERS file for
python-mutagen and sngrep.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
