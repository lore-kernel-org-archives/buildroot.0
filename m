From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Jul 2016 22:05:50 +0200
Subject: [Buildroot] [PATCH 1/1] mxsldr: new package
In-Reply-To: <1467913764-10467-1-git-send-email-erik.stromdahl@gmail.com>
References: <1467913764-10467-1-git-send-email-erik.stromdahl@gmail.com>
Message-ID: <20160708220550.6e9790df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Jul 2016 19:49:23 +0200, Erik Stromdahl wrote:
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> ---
>  package/Config.in.host        |    1 +
>  package/mxsldr/Config.in.host |    9 +++++++++
>  package/mxsldr/mxsldr.hash    |    2 ++
>  package/mxsldr/mxsldr.mk      |   21 +++++++++++++++++++++
>  4 files changed, 33 insertions(+)
>  create mode 100644 package/mxsldr/Config.in.host
>  create mode 100644 package/mxsldr/mxsldr.hash
>  create mode 100644 package/mxsldr/mxsldr.mk

Applied to master, after doing the following changes:

    [Thomas:
     - Rename prompt from "host-mxsldr" to "host mxsldr".
     - Add BR2_armeb in the list of architectures under which this package
       can be enabled.
     - Remove double quotes around the _SITE value.
     - The license is GPLv2+, not GPLv2.
     - Add a value for the _LICENSE_FILES variable
     - Rename MXSLDR_DEPENDENCIES to HOST_MXSLDR_DEPENDENCIES, since the
       dependencies of the host package are no longer derived from the
       dependencies of the target package.
     - Remove the MXSLDR_MAKE_OPTS variable that contained the PKG_CONFIG
       variable definition: it is already passed in HOST_CONFIGURE_OPTS.
     - Remove hash file, as it is not checked on Git packages for now.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
