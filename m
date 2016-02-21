From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 22:54:04 +0100
Subject: [Buildroot] [PATCH v2] gr-osmosdr: new package
In-Reply-To: <1454434662-4679-1-git-send-email-gwenj@trabucayre.com>
References: <1454434662-4679-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20160221225404.3760c728@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Tue,  2 Feb 2016 18:37:42 +0100, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Add support for gr-osmosdr - a GNU Radio block for interfacing with various
> radio hardware.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
> Changes v1 -> v2:
> 	- use github instead of tarball (issue with hash changed for same archive
> 	  content);
> 	- use 'select' gnuradio instead of 'depends on' gnuradio;
> 	- due to previous point add gnuradio list of  dependencies;
> 	- gr-osmosdr need gnuradio-block -> add select.
> ---
>  package/Config.in                  |  1 +
>  package/gr-osmosdr/Config.in       | 56 ++++++++++++++++++++++++++++++++++++++
>  package/gr-osmosdr/gr-osmosdr.hash |  2 ++
>  package/gr-osmosdr/gr-osmosdr.mk   | 55 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 114 insertions(+)
>  create mode 100644 package/gr-osmosdr/Config.in
>  create mode 100644 package/gr-osmosdr/gr-osmosdr.hash
>  create mode 100644 package/gr-osmosdr/gr-osmosdr.mk

I've applied to next, after doing a number of changes:

    [Thomas:
     - instead of selecting BR2_PACKAGE_GNURADIO, use "depends
       on". Indeed, it is fairly obvious for a user that some GNURadio
       extensions require GNURadio to be built. And it avoids the need to
       replicate all the complex dependencies of GNURadio.
     - remove comment that the Python support needs Python. It's fairly
       obvious, no?
     - remove comment about the thread dependency of
       BR2_PACKAGE_GR_OSMOSDR_RTLSDR, since anyway GNURadio already need
       threads. Yes, we sometimes still add such dependencies, but in the
       case of GNURadio, it's highly unlikely that GNURadio will ever
       loose the thread dependency.
     - use "NO" instead of "no" as the value for
       GR_OSMOSDR_SUPPORTS_IN_SOURCE_BUILD since we always use upper-case
       letters for the value of such booleans.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
