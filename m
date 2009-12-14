From: Michael S. Zick <minimod@morethan.org>
Date: Mon, 14 Dec 2009 15:00:57 -0600
Subject: [Buildroot] [Bug 803] [PATCH] lua - add shared library patch
	and config option for readline/ncurses support
In-Reply-To: <4B26A5E0.50908@zacarias.com.ar>
References: <bug-803-163@https.bugs.busybox.net/>
	<200912141422.01807.minimod@morethan.org>
	<4B26A5E0.50908@zacarias.com.ar>
Message-ID: <200912141500.59567.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon December 14 2009, Gustavo Zacarias wrote:
> Michael S. Zick wrote:
> 
> > Depends on the version - but the current and recent version have had the makefile
> > reorganized to always build-in the standard libraries;
> > So yes, the makefile needs to be un-reorganized (by a patch?) to get Lua + shared
> > libraries out of it.
> > (The prior to 5.0 organization).
> > 
> > Mike
> 
> I think we're on a different tune here.
>

No, I follow you, there is just two interpertations of "Lua" -
See my post on recommending that its inclusion in Buildroot should
be reorganized before too much time is spent doing these "special case"
changes.  I.E: the reorganization described in my post will also
give you what you are trying to achieve here.

Mike
> I'm commenting about the proposed patch that changes the lua package in
> the following ways:
> 1) Makes a shared liblua instead of a static one.
> 2) Allows the package to just install liblua with options for lua and luac.
> 3) Also allows for lua to be built without readline support.
> Plain upstream 5.1.4 lua (current in buildroot) doesn't build shared
> libraries by default, and that's what i talking about (point 1) and the
> proposed change in buildroot is probably lacking a patch (or the libtool
> hooks to do so in the .mk file).
> Regards.
> 
> 
