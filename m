From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2019 07:29:20 +0200
Subject: [Buildroot] [PATCH] package/jitterentropy-library: ensure make
 command is continued across new line
In-Reply-To: <20191025232302.24344-1-mmayer@broadcom.com> (Markus Mayer's
 message of "Fri, 25 Oct 2019 16:23:02 -0700")
References: <20191025232302.24344-1-mmayer@broadcom.com>
Message-ID: <87wocsgjm7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Mayer <mmayer@broadcom.com> writes:

 > The first line of JITTERENTROPY_LIBRARY_BUILD_CMDS must end with "\" to
 > concatenate the two lines.

 > Fixes: build error

 > [...]
 > /usr/bin/make -j33 -C
 > /local/users/mmayer/buildroot/output/arm64/build/jitterentropy-library-2.2.0
 > /local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-gcc
 > -shared -Wl,-soname,libjitterentropy.so.2 -o libjitterentropy.so.2.2.0
 > jitterentropy-base.o  -Wl,-z,relro,-z,now  -lrt
 > /local/users/mmayer/buildroot/output/arm64/host/bin/aarch64-linux-ar
 > rcs libjitterentropy.a jitterentropy-base.o
 > jitterentropy
 > /bin/bash: jitterentropy: command not found

 > Signed-off-by: Markus Mayer <mmayer@broadcom.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
