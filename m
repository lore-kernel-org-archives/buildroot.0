From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:36:22 +0100
Subject: [Buildroot] [PATCH] package/swupdate: do not store local build
 details in swupdate config file
In-Reply-To: <20200306103839.1880550-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 6 Mar 2020 11:38:39 +0100")
References: <20200306103839.1880550-1-thomas.petazzoni@bootlin.com>
Message-ID: <87lfo1lxax.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The SWUPDATE_SET_BUILD_OPTIONS macro sets a number of swupdate
 > configuration options with local build details, especially the
 > cross-compiler path and sysroot path.

 > This means that if one stores an swupdate defconfig file as part of
 > Buildroot, generated with "make swupdate-update-defconfig", it will
 > contain things like:

 > CONFIG_CROSS_COMPILE="/home/thomas/projets/buildroot/output/host/bin/arm-linux-"
 > CONFIG_SYSROOT="/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot"

 > which obviously are not good, as they are specific to where the build
 > was done.

 > So instead this commit:

 >  - Uses the CROSS_COMPILE environment variable to pass the
 >    cross-compiler path.

 >  - Drops entirely the use of CONFIG_SYSROOT, since all it does is pass
 >    a --sysroot option to the compiler, which is not needed in the
 >    context of Buildroot.

 >  - Pass EXTRA_CFLAGS/EXTRA_LDFLAGS also through the environment.

 > Thanks to that the swupdate defconfig file no longer contains any
 > local build details, and can be re-used by different users of a given
 > Buildroot configuration.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
