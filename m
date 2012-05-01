From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 May 2012 22:05:24 +0200
Subject: [Buildroot] [PATCH resend] stress: new package
In-Reply-To: <1335632365-12407-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 28 Apr 2012 18:59:25 +0200")
References: <1335632365-12407-1-git-send-email-arnout@mind.be>
Message-ID: <87bom71xbv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Arnout> +++ b/package/stress/stress.mk
 Arnout> @@ -0,0 +1,13 @@
 Arnout> +#############################################################
 Arnout> +#
 Arnout> +# stress - a workload generator
 Arnout> +#
 Arnout> +# http://weather.ou.edu/~apw/projects/stress/
 Arnout> +#
 Arnout> +#############################################################
 Arnout> +
 Arnout> +STRESS_VERSION = 1.0.4
 Arnout> +STRESS_SITE    = http://weather.ou.edu/~apw/projects/stress
 Arnout> +STRESS_SOURCE  = stress-$(STRESS_VERSION).tar.gz

.tar.gz is default, so you could get rid of this line.

 Arnout> +
 Arnout> +$(eval $(call AUTOTARGETS))
 Arnout> \ No newline at end of file

Please add a newline after AUTOTARGETS))

But more importantly, it seem to need largefile support:

gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"stress\" -DVERSION=\"1.0.4\" -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_UNISTD_H=1 -DHAVE_LIBM=1 -I.    -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -pipe -Os  -MT stress.o -MD -MP -MF .deps/stress.Tpo -c -o stress.o stress.c
In file included from /home/peko/source/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/ctype.h:27:0,
                 from stress.c:21:
/home/peko/source/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/features.h:219:5:
error: #error It appears you have defined
_FILE_OFFSET_BITS=64. Unfortunately, uClibc was built without large file
support enabled.

Care to fix and resend?

-- 
Bye, Peter Korsgaard
