From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 23 Sep 2014 23:37:52 +0200
Subject: [Buildroot] Pending "big" patch series
In-Reply-To: <20140923200255.1be119c9@free-electrons.com>
References: <20140914125321.0d68b842@free-electrons.com>
 <20140923200255.1be119c9@free-electrons.com>
Message-ID: <20140923213752.GA5923@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 23, 2014 at 08:02:55PM +0200, Thomas Petazzoni wrote:

> >  * Add libgtk3 and bump webkit to version 2.4.3 (3 patches)
> >    http://lists.busybox.net/pipermail/buildroot/2014-August/103387.html
> >
> >    Since the GSoC is over and Hadrien will not continue to work on
> >    Buildroot, someone needs to adopt those patches. Eric, maybe?
>
> Eric has taken over the libgtk3 patch and has sent a new version.
> Nobody has volunteered for webkit so far.

I had a quick look at the webkit patch. Webkit is a strange beast with issues
when building with parallelism activated. When building version 2.4.3, I
encountered the bug mentioned in the commit log, and when I bumped to 2.4.5,
I've found more parallel build issues (and some ARM ASM ones too).

It looks like version 2.6.0 is on its way. The build system now uses cmake
instead of autotools. I'll try a bump to 2.5.90 to see if the issues are
solved.

BTW, why is this package still called "webkit" whereas it is in fact
"webkit-gtk"?

Best regards,
ELB
