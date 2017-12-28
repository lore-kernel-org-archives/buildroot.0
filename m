From: Trent Piepho <tpiepho@impinj.com>
Date: Thu, 28 Dec 2017 22:58:51 +0000
Subject: [Buildroot] [PATCH] ncurses: Install 256 color terminfo files
In-Reply-To: <20171228233235.49005288@windsurf>
References: <20171220020624.22252-1-tpiepho@impinj.com>
 <20171228233235.49005288@windsurf>
Message-ID: <1514501930.26695.98.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2017-12-28 at 23:32 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 19 Dec 2017 18:06:24 -0800, Trent Piepho wrote:
> > There are three 256 color terminfo files that buildroot only installs if
> > ncurses is configured with wide character support, which also enables
> > ext-color.  There is a fourth 256 color terminfo file and does not depend
> > on wchar suport and is always installed.
> > 
> > This changes that to always install all four 256 color terminfo files.
> 
> The patch looks fine, but I'm confused when you say "all four 256 color
> terminfo files", while the patch only changes the installation of three
> terminfo files. Could you explain ?

The fourth file is already always installed.  I change from 3 wchar
dependent plus 1 unconditional to 4 unconditional.
