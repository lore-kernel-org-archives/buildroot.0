From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Apr 2020 17:03:48 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5webengine: fix build error
In-Reply-To: <238c867c-5852-8295-d62e-ee6bf6812391@benettiengineering.com>
References: <20190730115832.21008-1-b.bilas@grinn-global.com>
 <20190730233029.7360e1bd@gmx.net>
 <ff0a929f-f321-7eb6-a9ea-91abd85bacf5@grinn-global.com>
 <20190811223051.707ac1a8@windsurf.home>
 <238c867c-5852-8295-d62e-ee6bf6812391@benettiengineering.com>
Message-ID: <20200401170348.72cf210f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giulio,

Reviving this old thread.

On Fri, 20 Dec 2019 12:43:30 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> > Some googling leads to
> > https://github.com/OSSystems/meta-browser/issues/135, which itself
> > links to https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83623.
> > 
> > It seems like the bug has been fixed in both the gcc 6.x (fix was in gcc 6.5.0) and gcc 7.x
> > branches (fix was in gcc 7.3.0).  
> 
> And indeed I've built it successfully with gcc 7.5.

For the record, I'm hitting this compiler bug when building
qt5webengine on Buildroot 2019.02.x with gcc 7.4.0. I double checked,
and the fix pointed at
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83623 has been merged in
gcc 7.3.0, so it definitely is in gcc 7.4.0.

I am now trying to rebuild with gcc 7.5.0, since you said it was
successful for you. If it is, then the issue was not gcc bug 83623.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
