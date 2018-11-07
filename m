From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Nov 2018 23:48:40 +0100
Subject: [Buildroot] [PATCH 1/3] package/alsa-utils: re-enable in
 BR2_STATIC_LIBS configuration
In-Reply-To: <20181101170524.2756-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 1 Nov 2018 18:05:22 +0100")
References: <20181101170524.2756-1-thomas.petazzoni@bootlin.com>
Message-ID: <87a7mka4hj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > In commit 4707383c5d501a9ad7698579e5d0a4e2ab758c7e ("alsa-utils: needs
 > dynamic library support"), we added a !BR2_STATIC_LIBS dependency
 > because topology/topology.c was including <dlfcn.h>.

 > However, it turns out that this include is not needed/used at all, so
 > we can instead drop it, and re-enable the package in BR2_STATIC_LIBS
 > configuration.

 > This was discovered when analyzing why we have
 > package/alsa-lib/0003-alsa-lib-conditionally-enable-libdl-in-AM_PATH_ALSA-.patch. This
 > patch fixes the AM_PATH_ALSA autoconf macro, used by alsa-utils, so
 > that ALSA_LIBS doesn't carry the -ldl option, fixing static-linking
 > scenarios. This patch had become useless since alsa-utils was no
 > longer available in BR2_STATIC_LIBS configuration.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
