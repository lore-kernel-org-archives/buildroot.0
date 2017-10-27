From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 27 Oct 2017 19:30:47 +0200
Subject: [Buildroot] [PATCH v1] qt5base: remove nostrip qmake.conf
 config option
In-Reply-To: <20171027183441.529e95d6@windsurf.lan>
References: <20171027160522.21892-1-ps.report@gmx.net>
 <20171027183441.529e95d6@windsurf.lan>
Message-ID: <20171027193047.388c0893@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Fri, 27 Oct 2017 18:34:41 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Fri, 27 Oct 2017 18:05:22 +0200, Peter Seiderer wrote:
> > Re-enables the qmake default behaviour for qmake projects living
> > out-side of buildroot (debug build with-out strip, release build with
> > strip).
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>  
> 
> What is the reasoning for this?
> 
> I think we do want qmake to *not* strip anything, and leave it to
> Buildroot's BR2_STRIP_strip option to decide whether stripping should
> happen or not.

Mhhh, I see the reason for the in-buildroot usage of qmake, but still a bit
annoying for out-of-buildroot usage (but maybe a  'qmake CONIFG-=nostrip'
works here), would still prefer to keep the simple/original qmake
default and (maybe) add an additional 'CONFIG+=nostrip' to all in-buildroot
qmake usages?

Regards,
Peter

> 
> Thanks!
> 
> Thomas
