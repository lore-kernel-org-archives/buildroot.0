From: Craig Lawton-Devine <craig.lawtondevine@googlemail.com>
Date: Mon, 8 Mar 2010 11:12:27 +0000
Subject: [Buildroot] seg fault in pthread_exit only when dynamically built
Message-ID: <d51100e91003080312n6eac2148s435213aede83fa4a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I have seen a problem with my application when building it dynamically
linked to uclibc, but the problem doesn't occur when building
statically.

I have reproduced the problem with a small test app, version
buildroot-2010.02 of buildroot using uClibc-0.9.30.2.

The test app simply creates a given number of threads waits for 30s
and then quits. In the meantime each thread will print a message, wait
5s print another message and then quit.
Example output:
/ # pthreadtest 3
Creating 3 threads
Thread 1 started
Thread 2 started
Thread 3 started
Thread 1 completed
Thread 2 completed
Thread 3 completed
/ #

All works as expected either statically or dynamically linked until
the number of threads approaches 60 (it varies), after this all the
threads are started ok but the app will seg fault in pthread_exit if
dynamically built. If statically built the app is fine up to 100
threads (the most I tested so far).

Can someone help me to debug this problem or understand if further please?
I can post my test application if it helps.

Many thanks,
Craig Lawton-Devine
