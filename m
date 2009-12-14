From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2009 17:53:52 -0300
Subject: [Buildroot] [Bug 803] [PATCH] lua - add shared library patch
 and config option for readline/ncurses support
In-Reply-To: <200912141422.01807.minimod@morethan.org>
References: <bug-803-163@https.bugs.busybox.net/>	<20091214201632.1E292777F5@busybox.osuosl.org>
	<200912141422.01807.minimod@morethan.org>
Message-ID: <4B26A5E0.50908@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael S. Zick wrote:

> Depends on the version - but the current and recent version have had the makefile
> reorganized to always build-in the standard libraries;
> So yes, the makefile needs to be un-reorganized (by a patch?) to get Lua + shared
> libraries out of it.
> (The prior to 5.0 organization).
> 
> Mike

I think we're on a different tune here.
I'm commenting about the proposed patch that changes the lua package in
the following ways:
1) Makes a shared liblua instead of a static one.
2) Allows the package to just install liblua with options for lua and luac.
3) Also allows for lua to be built without readline support.
Plain upstream 5.1.4 lua (current in buildroot) doesn't build shared
libraries by default, and that's what i talking about (point 1) and the
proposed change in buildroot is probably lacking a patch (or the libtool
hooks to do so in the .mk file).
Regards.
