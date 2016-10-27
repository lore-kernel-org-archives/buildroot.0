From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Oct 2016 10:40:59 +0200
Subject: [Buildroot] [PATCH 1/2] glibc: install libmvec.so when available
In-Reply-To: <1477518479-6256-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 26 Oct 2016 23:47:58 +0200")
References: <1477518479-6256-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874m3yjias.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > On some architectures (namely x86-64), glibc may provide a libmvec
 > library since glibc 2.22, which programs built with gcc OpenMP support
 > might get linked to.

 > In order for these programs to work on the target, we need to copy
 > this library to the target filesystem.

 > This commit takes care of this for the glibc package (used for the
 > internal toolchain backend). Note that libraries listed in
 > GLIBC_LIBS_LIB are silently ignored if they don't exist. Therefore, we
 > don't need to have any condition on the architecture or glibc version.

 > For more details on libmvec, see
 > https://sourceware.org/glibc/wiki/libmvec.

 > Fixes bug #9111.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
