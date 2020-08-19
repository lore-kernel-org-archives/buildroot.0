From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Aug 2020 23:21:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/dump1090: fix build with gcc 10
In-Reply-To: <20200819184018.2341818-1-fontaine.fabrice@gmail.com>
References: <20200819184018.2341818-1-fontaine.fabrice@gmail.com>
Message-ID: <20200819212155.GV24264@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-08-19 20:40 +0200, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/88dc97fcaa649014edb3b54a5dd4bd8ec4715bbd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks, even if...

> ---
[--SNIP--]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/MalcolmRobb/dump1090/pull/96]

... there is little chance this will eventually be applied (no commit in
the past 6 years, 997 forks, upstream itself a fork already)...  Sigh :-(

Regards,
Yann E. MORIN.

> +---
> + dump1090.c | 3 +++
> + dump1090.h | 4 ++--
> + view1090.c | 3 +++
> + 3 files changed, 8 insertions(+), 2 deletions(-)
> +
> +diff --git a/dump1090.c b/dump1090.c
> +index 60882fc..1482224 100644
> +--- a/dump1090.c
> ++++ b/dump1090.c
> +@@ -29,6 +29,9 @@
> + //
> + #include "coaa.h"
> + #include "dump1090.h"
> ++
> ++struct modes Modes;
> ++
> + //
> + // ============================= Utility functions ==========================
> + //
> +diff --git a/dump1090.h b/dump1090.h
> +index 9ad4de0..283e760 100644
> +--- a/dump1090.h
> ++++ b/dump1090.h
> +@@ -235,10 +235,10 @@ struct stDF {
> +     uint64_t         llTimestamp;                // Timestamp at which the this packet was received
> +     uint32_t         addr;                       // Timestamp at which the this packet was received
> +     unsigned char    msg[MODES_LONG_MSG_BYTES];  // the binary
> +-} tDF;
> ++};
> + 
> + // Program global state
> +-struct {                             // Internal state
> ++extern struct modes {                             // Internal state
> +     pthread_t       reader_thread;
> + 
> +     pthread_mutex_t data_mutex;      // Mutex to synchronize buffer access
> +diff --git a/view1090.c b/view1090.c
> +index 0b9b8b9..cc072fc 100644
> +--- a/view1090.c
> ++++ b/view1090.c
> +@@ -29,6 +29,9 @@
> + //
> + #include "coaa.h"
> + #include "view1090.h"
> ++
> ++struct modes Modes;
> ++
> + //
> + // ============================= Utility functions ==========================
> + //
> +-- 
> +2.27.0
> +
> -- 
> 2.27.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
