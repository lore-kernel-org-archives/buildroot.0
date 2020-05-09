From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 23:16:41 +0200
Subject: [Buildroot] [PATCH v1] package/libv4l: fix input_event related
 compile failure
In-Reply-To: <20200504215107.27069-1-ps.report@gmx.net>
References: <20200504215107.27069-1-ps.report@gmx.net>
Message-ID: <20200509231641.0fd11ca9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 May 2020 23:51:07 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Add two upstream patches fixing input_event time related
> compile failures.
> 
> Fixes:
> 
>  - http://autobuild.buildroot.net/results/3883a948e30cfd235cfca1fb8646fe8032f5e18d
> 
>   keytable.c: In function 'test_event':
>   keytable.c:1536:11: error: 'struct input_event' has no member named 'time'; did you mean 'type'?
>        ev[i].time.tv_sec, ev[i].time.tv_usec,
>              ^~~~
>              type
>   keytable.c:1536:30: error: 'struct input_event' has no member named 'time'; did you mean 'type'?
>        ev[i].time.tv_sec, ev[i].time.tv_usec,
>                                 ^~~~
>                                 type
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...02-keytable-use-input_event-properly.patch | 36 +++++++++++++++++++
>  ...dd-compatibility-for-input_event_sec.patch | 35 ++++++++++++++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 package/libv4l/0002-keytable-use-input_event-properly.patch
>  create mode 100644 package/libv4l/0003-keytable-add-compatibility-for-input_event_sec.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
