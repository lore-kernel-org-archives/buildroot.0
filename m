From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 22:33:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/opencv3: disable NEON and VFPv3
 options
In-Reply-To: <20200205175228.148236d5@windsurf> (Thomas Petazzoni's message of
 "Wed, 5 Feb 2020 17:52:28 +0100")
References: <20190820184039.28611-1-fontaine.fabrice@gmail.com>
 <20200205175228.148236d5@windsurf>
Message-ID: <87d09jopxl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Tue, 20 Aug 2019 20:40:39 +0200
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> -# * PowerPC support is turned off since its only effect is altering CFLAGS,
 >> -#   adding '-mcpu=G3 -mtune=G5' to them, which is already handled by Buildroot.
 >> +# * PowerPC, NEON and VFPv3 support are turned off since their only effects are
 >> +#   altering CFLAGS, adding '-mcpu=G3 -mtune=G5', '-mfpu=neon' or '-mfpu=vfpv3'
 >> +#   to them, which is already handled by Buildroot.
 >> OPENCV3_CONF_OPTS += \
 >> -DENABLE_POWERPC=OFF \
 >> -	-DENABLE_NEON=$(if $(BR2_ARM_CPU_HAS_NEON),ON,OFF)
 >> -
 >> -ifeq ($(BR2_ARCH_IS_64):$(BR2_ARM_CPU_HAS_VFPV3),:y)
 >> -OPENCV3_CONF_OPTS += -DENABLE_VFPV3=ON
 >> -else
 >> -OPENCV3_CONF_OPTS += -DENABLE_VFPV3=OFF
 >> -endif
 >> +	-DENABLE_NEON=OFF \
 >> +	-DENABLE_VFPV3=OFF
 >> 
 >> # Cuda stuff
 >> OPENCV3_CONF_OPTS += \

 > So, we looked into it some more with Arnout, and turns out that
 > ENABLE_NEON=ON does more than adding options to CFLAGS, it enables some
 > NEON specific code in the Carotene sublibrary at least.

 > However, for VFPv3 indeed it is true that it was only adding CFLAGS. So
 > we reduced the patch to just do -DENABLE_VFPV3=OFF, and applied.

 > Thanks a lot!

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
