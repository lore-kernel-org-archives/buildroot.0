From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 00:00:17 +0200
Subject: [Buildroot] [PATCH] package/pulseview: fix build when linking
 against libatomic is needed
In-Reply-To: <20160525214554.26606-1-s.martin49@gmail.com>
References: <20160525214554.26606-1-s.martin49@gmail.com>
Message-ID: <20160526000017.7f9c7540@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 May 2016 23:45:54 +0200, Samuel Martin wrote:

> ++    list(APPEND CMAKE_REQUIRED_LIBRARIES "atomic")

Since you have this here.

> ++    check_working_cxx_atomics(HAVE_CXX_ATOMICS_WITH_LIB)
> ++    if (NOT HAVE_CXX_ATOMICS_WITH_LIB)
> ++      message(FATAL_ERROR "Host compiler must support std::atomic!")
> ++    endif()
> ++  else()
> ++    message(FATAL_ERROR "Host compiler appears to require libatomic, but cannot find it.")
> ++  endif()
> ++endif()
> ++
> ++if(HAVE_CXX_ATOMICS_WITH_LIB)
> ++  set(ATOMIC_LIBRARIES "-latomic")

Is this needed?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
