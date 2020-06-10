From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 23:25:44 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/brltty: fix input_event
 related compile failure
In-Reply-To: <20200607181116.29433-1-heiko.thiery@gmail.com>
References: <20200607181116.29433-1-heiko.thiery@gmail.com>
Message-ID: <20200610232544.0c7afc3c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  7 Jun 2020 20:11:17 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Add a patch to fix input_event time related compile failure. The problem
> is reported and fixed upstream.
> 
> Fixes:
> http://autobuild.buildroot.net/results/7c5278c0ff2b2d8f88803e256803b31a75904efe/build-end.log
> 
> ./system_linux.c: In function 'writeInputEvent':
> ./system_linux.c:962:23: error: 'struct input_event' has no member named 'time'; did you mean 'type'?
>    gettimeofday(&event.time, NULL);
>                        ^~~~
>                        type
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  ...nput_event-time-related-compile-fail.patch | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 package/brltty/0002-fix-input_event-time-related-compile-fail.patch

Applied to master, thanks. If not already done, please submit the patch
upstream. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
