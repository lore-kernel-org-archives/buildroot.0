From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 23:00:52 +0200
Subject: [Buildroot] [PATCH 1/1] ibrdtn-tools: new package
In-Reply-To: <1439078419-2828-1-git-send-email-tom_a_sparks@yahoo.com.au>
References: <1439078419-2828-1-git-send-email-tom_a_sparks@yahoo.com.au>
Message-ID: <20150829230052.4aaf876a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tom Sparks,

On Sun,  9 Aug 2015 10:00:19 +1000, Tom Sparks wrote:
> Signed-off-by: Tom Sparks <tom_a_sparks@yahoo.com.au>
> ---
>  package/ibrdtn-tools/Config.in       | 16 ++++++++++++++++
>  package/ibrdtn-tools/ibrdtn-tools.mk | 30 ++++++++++++++++++++++++++++++
>  package/ibrdtnd/Config.in            |  1 +
>  3 files changed, 47 insertions(+)
>  create mode 100644 package/ibrdtn-tools/Config.in
>  create mode 100644 package/ibrdtn-tools/ibrdtn-tools.mk

I've applied your patch to the next branch, after doing a good number
of changes:

    [Thomas:
      - include package/ibrdtn-tools/Config.in from package/Config.in
      - fix the Config.in option name: we don't use - in option names, it
        should be replaced by _. Also do the same change in the .mk file.
      - from Config.in, don't select BR2_PACKAGE_IBRDTND (it's not a
        dependency of ibrdtn-tools), but instead select
        BR2_PACKAGE_IBRCOMMON and BR2_PACKAGE_IBRDTN.
      - in the Config.in file, fix the comment dependency logic (we want
        the comment to be shown when either thread support *or* C++
        support is missing)
      - add hash file.
      - do not install to staging, since the package does not install any
        library
      - remove IBRDTN_TOOLS_SOURCE variable, since it's equal to the
        default value
      - add ibrcommon, ibrdtn and host-pkgconf as mandatory dependencies,
        and handle libdaemon and libarchive as optional dependencies.
      - remove custom INSTALL_STAGING_OPTS and INSTALL_TARGET_OPTS:
        automake is used, so there's no need for any hack.]

Now, if you could test the next branch, and verify that the four ibrdtn
packages you submitted are still working, it would be good.

Also, on the ibrdtnd package, which installs a daemon, it would be good
to add an init script to start the daemon at boot time.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
