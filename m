From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Nov 2018 23:48:45 +0100
Subject: [Buildroot] [PATCH 2/3] package/alsa-lib: drop patch
 0002-alsa-lib-provide-dummy-definitions-of-RTLD_-if-neces.patch
In-Reply-To: <20181101170524.2756-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 1 Nov 2018 18:05:23 +0100")
References: <20181101170524.2756-1-thomas.petazzoni@bootlin.com>
 <20181101170524.2756-2-thomas.petazzoni@bootlin.com>
Message-ID: <875zx8a4he.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The description of this patch was no longer correct: it no longer
 > provided dummy definitions of RTLD_* macros since commit
 > ccad7db515fa79d2331e4e949aafb32eca0b5214 ("alsa-lib: bump to version
 > 1.1.6"). All it did is make two <dlfcn.h> inclusions optional.

 > However, this is no longer needed, since the alsa-lib code base
 > contains four inclusions of <dlfcn.h>, which are all properly handled:

 >  - include/local.h, the include is guarded by #ifdef HAVE_LIBDL

 >  - modules/mixer/simple/sbasedl.c, modules are only built if
 >    BUILD_MODULES is enabled, and BUILD_MODULES is only enabled if
 >    HAVE_LIBDL is enabled

 >  - src/mixer/simple_abst.c, this file is only built if BUILD_MODULES
 >    is enabled, which itself is only enabled if HAVE_LIBDL is enabled

 >  - src/pcm/pcm_meter.c, this file is only built if
 >    BUILD_PCM_PLUGIN_METER is enabled, and this is not enabled if
 >    HAVE_LIBDL is not enabled.

 > Conclusion: the patch can be dropped. The third patch is renumbered as
 > appropriate.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
