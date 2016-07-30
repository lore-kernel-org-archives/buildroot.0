From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 14:31:39 +0200
Subject: [Buildroot] [PATCH] iperf: bump to version 2.0.9
In-Reply-To: <0fe5e4e62f4093b8d30fd1155d8832cd2482a57e.1469784407.git.baruch@tkos.co.il>
References: <0fe5e4e62f4093b8d30fd1155d8832cd2482a57e.1469784407.git.baruch@tkos.co.il>
Message-ID: <20160730143139.10ffbed2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Jul 2016 12:26:47 +0300, Baruch Siach wrote:
> iperf2 is a fork of the original unmaintained iperf project, that continues
> the development of the iperf 2.x series. Update homepage link, and download
> location.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/iperf/0001-add-missing-header.patch | 28 ++++++++++++++++++++++++++++
>  package/iperf/Config.in                     |  2 +-
>  package/iperf/iperf.hash                    |  4 +++-
>  package/iperf/iperf.mk                      |  4 ++--
>  4 files changed, 34 insertions(+), 4 deletions(-)
>  create mode 100644 package/iperf/0001-add-missing-header.patch

I've applied, after doing the following changes:

    [Thomas:
     - change the download location to use downloads.sourceforge.net
     - turn the patch into a Git-formatted one, since upstream uses Git as
       its version control system
     - as noticed by Khem Raj, a C99 compiler is needed for the bool type,
       so added AC_PROG_CC_C99 to configure.ac, and consequently added
       IPERF_AUTORECONF = YES.
     - removed two <pkg>_CONF_ENV variables related to the bool type, they
       were added by an older commit
       e13ac0ec8788092c6508636da94fe0198c18dffd back when we had a
       config.cache shared between packages (which is no longer the case
       today)]

If you could submit the updated patch upstream, it would be good.
Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
