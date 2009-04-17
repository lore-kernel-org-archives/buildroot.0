From: Sven Neumann <s.neumann@phase-zero.de>
Date: Fri, 17 Apr 2009 12:25:04 +0200
Subject: [Buildroot] pkgconfig confusion
In-Reply-To: <1239962164.6397.6.camel@sven>
References: <1239962164.6397.6.camel@sven>
Message-ID: <1239963904.6397.9.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, 2009-04-17 at 11:56 +0200, Sven Neumann wrote:
> Hi,
> 
> I've tried to update to the latest buildroot snapshot today and ran into
> a problem with pkg-config:
> 
> >>> pkgconfig undefined Extracting
> gzip: /home/sven/buildroot-new/dl/pkgconfig-undefined.tar.gz: No such
> file or directory
> tar: This does not look like a tar archive
> 
> So I had a look at package/pkgconfig/pkgconfig.mk and found that it
> defines all variables with the PKG_CONFIG prefix instead of using
> PKGCONFIG. Changing this seems to fix the problem (see attached diff).
> Alternatively one could rename pkgconfig/pkgconfig.mk to
> pkg-config/pkg-config.mk.

Actually, the patch from my last mail changes a bit too much.
PKG_CONFIG_HOST_DIR and PKG_CONFIG_HOST_BINARY must not be changed as
other packages use these variables. Perhaps the best solution is really
to rename the package from pkgconfig to pkg-config.


Sven
