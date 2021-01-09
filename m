From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 09 Jan 2021 16:01:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/multipath-tools: disable -Werror
In-Reply-To: <20210108170629.35571-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 8 Jan 2021 18:06:29 +0100")
References: <20210108170629.35571-1-fontaine.fabrice@gmail.com>
Message-ID: <87czyexig1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Set the new WARNFLAGS to "" which has been added since version 0.8.5 and
 > https://github.com/opensvc/multipath-tools/commit/82f1b164cb21c9632b3c73f865d97777c7a61e0d

 > Otherwise, -Werror will raise the following build failure:

 > /srv/storage/autobuild/run/instance-3/output-1/host/bin/mipsel-linux-gcc
 > --std=gnu99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 > -D_FILE_OFFSET_BITS=64 -O2 -D_FORTIFY_SOURCE=1 -Werror -Wall -Wextra
 > -Wformat=2 -Werror=implicit-int -Werror=implicit-function-declaration
 > -Werror=format-security -Wno-clobbered -Wno-error=clobbered
 > -Werror=cast-qual -Werror=discarded-qualifiers -pipe
 > -DBIN_DIR=\"/sbin\" -DLIB_STRING=\"lib\" -DRUN_DIR=\"run\" -MMD -MP
 > -fPIC -I.. -I../../libmultipath/nvme -Wp,-D_FORTIFY_SOURCE=2 -c -o
 > nvme.o nvme.c
 > <command-line>: error: "_FORTIFY_SOURCE" redefined [-Werror]

Ideally we should fix the package to not set _FORTIFY_SOURCE (so our
BR2_FORTIFY_* settings are used), but Ok - Disabling Werror is good
anyway, so committed, thanks.

-- 
Bye, Peter Korsgaard
