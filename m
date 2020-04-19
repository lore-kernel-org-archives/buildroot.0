From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 15:59:50 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/apcupsd: new package
In-Reply-To: <20200419003953.11676-1-james.hilliard1@gmail.com>
References: <20200419003953.11676-1-james.hilliard1@gmail.com>
Message-ID: <20200419155950.3e3be703@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 18 Apr 2020 18:39:53 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Apcupsd is a UPS control system that permits orderly shutdown of your
> computer in the event of a power failure.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - set ac_cv_path_usbcfg
>   - add apcupsd config sub-options
> ---
>  DEVELOPERS                   |  1 +
>  package/Config.in            |  1 +
>  package/apcupsd/Config.in    | 58 +++++++++++++++++++++++++++++++
>  package/apcupsd/apcupsd.hash |  6 ++++
>  package/apcupsd/apcupsd.mk   | 67 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 133 insertions(+)
>  create mode 100644 package/apcupsd/Config.in
>  create mode 100644 package/apcupsd/apcupsd.hash
>  create mode 100644 package/apcupsd/apcupsd.mk

The build fails when the host machine doesn't have 'man' and 'col' to
generate the documentation:

  http://autobuild.buildroot.net/results/e65/e65c23c3c1cae9aa9d697323fabf8a6f310fc3ba/build-end.log

Could you have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
