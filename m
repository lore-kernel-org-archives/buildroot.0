From: Craig Butler <crbutler@tycoint.com>
Date: Mon, 27 Jul 2009 11:58:51 +0100
Subject: [Buildroot] uclibc busybox problems dm365 - rcS: applet not
	found ???
In-Reply-To: <1248654709.37180.18.camel@main.lerwick.hopto.org>
References: <1248654709.37180.18.camel@main.lerwick.hopto.org>
Message-ID: <1248692331.37180.36.camel@main.lerwick.hopto.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2009-07-27 at 01:31 +0100, Craig Butler wrote:
>  
>  Hi All
> 
> I am having an issue trying to boot a dm365 using a busybox compiled
> using the buildroot uclibc toolchain;
> 
> Freeing init memory: 128K
> rcS: applet not found
> 
> Please press Enter to activate this console. 
> 
> Please press Enter to activate this console.  -- loops
> 
> It appears as tho the sh link isn't working...
> 
> Exactly the same busybox .config works when compiled with a glibc
> based toolchain (grabbed from codesourcery.com), can get the board up
> and working, obtain an dhcp lease, and telnet onto it.
> 
> I have set busybox to be statically compiled.
> 
> Anyone seen this issue before ? 
> 
> -- 
> Kind Regards
> 
> Craig Butler
> Linux Systems Administrator
> American Dynamics, Belfast
> 
> e- crbutler at tycoint.com
>  


Hi All

Big thanks goes to Jacmet on irc.freenode.net/#uclibc it turned out to
be a hard/softfloat miss match.

Enabling use software floating point by default made the issue go away,
yippi

Thanks again

Craig B
 
--------------------------------------------------------

Tyco Safety Products/CEM Systems Ltd.
Registered in Northern Ireland: NI 25728.  Registered Office: 195 Airport Road West, Belfast, BT3 9ED.
 
Please note that any views or opinions presented in this email are solely those of the author and do not necessarily represent those of the company. This email and any attachments are confidential and intended solely for the use of the individual or entity to whom they are addressed. If you have received this email in error please notify the sender immediately and delete any copies in your possession.
