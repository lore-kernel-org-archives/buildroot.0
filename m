From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 19:52:32 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/mosquitto: security bump to
 v1.6.12
In-Reply-To: <20200829130610.169904-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Sat, 29 Aug 2020 15:06:10 +0200")
References: <20200829130610.169904-1-titouan.christophe@railnova.eu>
Message-ID: <87zh6de3vj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > Mosquitto 1.6.11 is a bugfix release, read the whole announcement on
 > http://mosquitto.org/blog/2020/08/version-1-6-11-released/

 > Mosquitto 1.6.12 is a security and bugfix release, read
 > http://mosquitto.org/blog/2020/08/version-1-6-12-released/

 > From the 1.6.11 changelog of the client library:
 > mosquitto_loop_start() now sets a thread name on Linux, FreeBSD, NetBSD,
 > and OpenBSD. Closes #1777.
 > This is done with pthread_setname_np; so mosquitto now requires
 > BR2_TOOLCHAIN_HAS_THREADS_NPTL when built with threading support.

 > 2 reverse dependencies use the threaded API, but they already
 > depend on BR2_TOOLCHAIN_HAS_THREADS_NPTL:
 > * domoticz [1] (we add a comment for mosquitto)
 > * shairport-sync [2]

 > [1] https://github.com/domoticz/domoticz/blob/2020.1/main/mosquitto_helper.cpp#L344
 > [2] https://github.com/mikebrady/shairport-sync/blob/3.3.6/mqtt.c#L227-L229

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
 > ---
 > Changes v1->v2:
 > * Conditionally depend on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 > * Add patch to support building on platforms without pthread

 > Changes v2->v3:
 > * Bump to newer version 1.6.12
 > * Drop patch that was released upstream
 > * Don't add custom option BR2_PACKAGE_MOSQUITTO_WITH_THREADING

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
