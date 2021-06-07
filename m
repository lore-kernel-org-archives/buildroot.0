From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Jun 2021 23:35:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/llvm: include limits
In-Reply-To: <20210522151037.14378-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 22 May 2021 17:10:37 +0200")
References: <20210522151037.14378-1-fontaine.fabrice@gmail.com>
Message-ID: <87mts1uzlt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure:
 > In file included from /data/buildroot-autobuilder/instance-0/output-1/build/host-llvm-9.0.1/utils/benchmark/src/benchmark_register.cc:15:
 > /data/buildroot-autobuilder/instance-0/output-1/build/host-llvm-9.0.1/utils/benchmark/src/benchmark_register.h: In function 'void AddRange(std::vector<T>*, T, T, int)':
 > /data/buildroot-autobuilder/instance-0/output-1/build/host-llvm-9.0.1/utils/benchmark/src/benchmark_register.h:17:30: error: 'numeric_limits' is not a member of 'std'
 >    17 |   static const T kmax = std::numeric_limits<T>::max();
 >       |                              ^~~~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/68581aad7c622a1fc74bb5556799e3c681425b2a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
