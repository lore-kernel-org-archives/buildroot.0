From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 12 Nov 2018 19:41:13 +0100
Subject: [Buildroot] [PATCH v1] valgrind: fix mips64 compile
In-Reply-To: <20181109115556.424971fe@windsurf>
References: <20181108230814.4773-1-ps.report@gmx.net>
 <20181109115556.424971fe@windsurf>
Message-ID: <20181112194113.2802404d@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Fri, 9 Nov 2018 11:55:56 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> On Fri,  9 Nov 2018 00:08:14 +0100, Peter Seiderer wrote:
> > Disable gcc march mips64r2 detection (use compile flags already
> > set by buildroot only), avoids double setting like '-march=mips64
> > ... -march=mips64r2 -mabi=64'.
> > 
> > Fixes [1]:
> > 
> >   error: '-mips64r2' conflicts with the other architecture options, which specify a mips64 processor
> > 
> > [1] http://autobuild.buildroot.net/results/34f6e2352f1559f98c724fe5394db0035b42ddb1
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>  
> 
> Thanks for this patch. Could we find something acceptable upstream? Why
> is valgrind configure script enforcing those CFLAGS ?

Suggested upstream, see:

https://bugs.kde.org/show_bug.cgi?id=400975

Regards,
Peter

> 
> Thomas
