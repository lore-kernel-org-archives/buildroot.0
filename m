From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Mon, 22 Jun 2020 09:49:00 +0200
Subject: [Buildroot] [PATCH=2020.02.x] package/redis: bump version to
 5.0.9
In-Reply-To: <20200621213921.11923-1-peter@korsgaard.com>
References: <20200621213921.11923-1-peter@korsgaard.com>
Message-ID: <8cb0702e-2c5d-553b-5793-681ddc619130@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter and all,

On 21/06/20 23:39, Peter Korsgaard wrote:
> Fixes a critical issue related to streams. From the release notes:
> 
> ================================================================================
> Redis 5.0.9     Released Thu Apr 17 12:41:00 CET 2020
> ================================================================================
> 
> Upgrade urgency:CRITICAL if you use Streams with AOF ore replicas.
>                  Otherwise the upgrade urgency is LOW.
> 
> This release has a speed improvement and a critical fix:
> 
>      * FIX: XREADGROUP when fetching data in a blocking way, would not
>             emit the XCLAIM in the AOF file and to replicas. This means
>             that the last ID is not updated, and that restarting the server
>             will have the effect of reprocessing some entries.
>      * NEW: Clients blocked on the same key are now unblocked on
>             O(1) time. Backported from Redis 6.
> 
> Commits:
> 
>      1fc8ef81a Fix XCLAIM propagation in AOF/replicas for blocking XREADGROUP.
>      a5e24eabc Speedup: unblock clients on keys in O(1).
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>Acked-by: Titouan Christophe <titouan.christophe@railnova.eu>
