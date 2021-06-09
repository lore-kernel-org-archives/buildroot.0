From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Jun 2021 22:55:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: disable logs with riscv32
In-Reply-To: <20210521200323.426580-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 21 May 2021 22:03:23 +0200")
References: <20210521200323.426580-1-fontaine.fabrice@gmail.com>
Message-ID: <875yymoj15.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > boost logs can't be built with riscv32 because it unconditionally uses
 > __NR_futex:

 > libs/log/src/event.cpp: In member function 'void boost::log::v2_mt_posix::aux::futex_based_event::wait()':
 > libs/log/src/event.cpp:38:29: error: '__NR_futex' was not declared in this scope
 >    38 | #define BOOST_LOG_SYS_FUTEX __NR_futex
 >       |                             ^~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/8c8135fd7c0517c66c9b3975c494da6d7934cc1b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
