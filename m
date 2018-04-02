From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 2 Apr 2018 16:49:46 +0200
Subject: [Buildroot] [Patch next v2 0/3] Fixes for qt5: bump latest
 version to 5.10.1
In-Reply-To: <20180302193437.15573-1-ps.report@gmx.net>
References: <20180302193437.15573-1-ps.report@gmx.net>
Message-ID: <dc5f6f14-4613-c114-bb18-73f50f0c463e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-03-18 20:34, Peter Seiderer wrote:
> Some fixes for the 'qt5: bump latest version to  5.10.1' patch
> from Ga?l Portray.
> 
> Peter Seiderer (3):
>   sqlite: add option for meta-data about tables/queries
>   qt5base: fix Qt5.10.1 sqlite plugin compile failure
>   qt5multimedia: fix Qt5.10.1 target installation
> 
> 
> Peter Seiderer (3):
>   sqlite: add option for meta-data about tables/queries
>   qt5base: fix Qt5.10.1 sqlite plugin compile failure
>   qt5multimedia: fix Qt5.10.1 target installation

 I squashed these into the commit doing the version bump and applied all of it
to master.

 For the host-pkg-config utility, we decided not to go for the generic
host-pkg-config as this is not the proper thing to do (as discussed before). So
instead, a host-pkg-config is generated within the qt5webengine package. I also
modified it to do exactly what we do for normal host packages (cfr.
package/Makefile.in). That seems to work for me.

 I also carried over the mesa3d X11 patch that wasn't there yet when Gael
submitted this series.

 Finally, I had to do a whole lot of fixes in legal info, because the filenames
have changed in some modules. Also the chromium license files had to be regenerated.

 Thanks for doing this bump!

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
