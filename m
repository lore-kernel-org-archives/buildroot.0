From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Mar 2020 23:37:31 +0100
Subject: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: clear
 multiprocessing pools after use
In-Reply-To: <20200301212528.15754-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Sun, 1 Mar 2020 22:25:28 +0100")
References: <20200301212528.15754-1-titouan.christophe@railnova.eu>
Message-ID: <87mu8ycris.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > During the CVE checking phase, we can still see a huge amount of
 > Python processes (actually 128) running on the host, even though
 > the CVE step is entirely ran in the main thread.

 > These are actually the worker processes spawned to check for the
 > packages URL statuses and the latest versions from release-monitoring.
 > This is because of an issue in Python's multiprocessing implementation:
 > https://bugs.python.org/issue34172

 > The problem was already there before the CVE matching step was
 > introduced, but because pkg-stat was terminating right after the
 > release-monitoring step, it went unnoticed.

 > Also, do not hold a reference to the multiprocessing pool from
 > the Package class, as this is not needed.

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Committed, thanks.

-- 
Bye, Peter Korsgaard
