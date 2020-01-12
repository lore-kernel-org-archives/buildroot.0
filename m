From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jan 2020 11:50:21 +0100
Subject: [Buildroot] [PATCH v5 1/1] package/grpc: bump to version 1.25.0
In-Reply-To: <20191206222549.3946042-1-aduskett@gmail.com> (aduskett's message
 of "Fri, 6 Dec 2019 14:25:49 -0800")
References: <20191206222549.3946042-1-aduskett@gmail.com>
Message-ID: <87sgklc5jm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Other changes:
 >   - Remove upstream patch 0004-Fix-gettid-naming-conflict.patch
 >   - Remove upstream patch 0005-Rename-gettid-functions.patch
 >   - Add a check for BR2_TOOLCHAIN_GCC_AT_LEAST_5 in grpc.mk. If the selected
 >     toolchain is not at least version 5 or higher, set the GRPC_CFLAGS and
 >     GRPC_CXXFLAGS optimizations to -O3. This check prevents the following error:
 >       error: failure memory model cannot be stronger than success memory
 >       model for '__atomic_compare_exchange'

..

 > +# Toolchains older than gcc5 will fail to compile with -0s due to:
 > +# error: failure memory model cannot be stronger than success memory model for
 > +# '__atomic_compare_exchange'
 > +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5):$(BR2_OPTIMIZE_S),:y)
 > +GRPC_CFLAGS += -O3
 > +GRPC_CXXFLAGS += -O3
 > +endif

This workaround is also needed for 1.23.0, so I've cherry picked this
hunk to 2019.11.x.

-- 
Bye, Peter Korsgaard
