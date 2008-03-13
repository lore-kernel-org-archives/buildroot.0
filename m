From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 13 Mar 2008 12:21:48 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <47D90410.7000409@carallon.com>
References: <20080312135303.CCD1B120150@busybox.net>
	<47D82493.6090505@carallon.com> <1205389575.6797.7.camel@localhost>
	<47D90410.7000409@carallon.com>
Message-ID: <1205407308.8626.10.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2008-03-13 at 10:38 +0000, Will Wagner wrote:
> Hans-Christian Egtvedt wrote:
> > On Wed, 2008-03-12 at 18:44 +0000, Will Wagner wrote:
> >> ninevoltz at uclibc.org wrote:
> > 
> > <snipp>
> > 
> >>> -config BR2_PACKAGE_QTOPIA4_DEPTHS
> >>> -	string "color depths to support"
> >>> -	default "-depths 8"
> >>> -	depends BR2_PACKAGE_QTOPIA4
> >>> -	help
> >>> -	    Which color depths to support for the library. Default is "-depths
> >>> -	    8". Is specified by a comma separated list, i.e. -depths 24,16,8.
> >>> -
> >> Why have you removed the option to configure supported colour depths?
> >>
> > 
> > Why do you need it? It would only reduce the footprint by some kB anyway
> > to specify a specific color depth.
> 
> I want it exactly because it does save a few kB. Perhaps we should add 
> it back in but change the default to all?
> 

 ~ > du -sk usr/lib/libQt*so.4.4.0 | sort -n
48      usr/lib/libQtTest.so.4.4.0
160     usr/lib/libQtXml.so.4.4.0
196     usr/lib/libQtSvg.so.4.4.0
396     usr/lib/libQtNetwork.so.4.4.0
492     usr/lib/libQtScript.so.4.4.0
1792    usr/lib/libQtCore.so.4.4.0
5436    usr/lib/libQtGui.so.4.4.0

These are stripped binaries.

That is roughly 8 MB of shared libraries, give or take a few kB's will
also depend a lot on your compiler.

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
