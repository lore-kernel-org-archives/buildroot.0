From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jul 2020 23:44:50 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/brltty: fix input_event
 related compile failure
In-Reply-To: <20200607181116.29433-1-heiko.thiery@gmail.com> (Heiko Thiery's
 message of "Sun, 7 Jun 2020 20:11:17 +0200")
References: <20200607181116.29433-1-heiko.thiery@gmail.com>
Message-ID: <87mu44l86l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:

 > Add a patch to fix input_event time related compile failure. The problem
 > is reported and fixed upstream.

 > Fixes:
 > http://autobuild.buildroot.net/results/7c5278c0ff2b2d8f88803e256803b31a75904efe/build-end.log

 > ./system_linux.c: In function 'writeInputEvent':
 > ./system_linux.c:962:23: error: 'struct input_event' has no member named 'time'; did you mean 'type'?
 >    gettimeofday(&event.time, NULL);
 >                        ^~~~
 >                        type

 > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Committed to 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
