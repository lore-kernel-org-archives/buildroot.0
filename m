From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 10:15:28 +0200
Subject: [Buildroot] [PATCH v3 2/2] support/scripts/pkg-stats: URL check
 using threads
In-Reply-To: <1538447849-46511-2-git-send-email-matthew.weber@rockwellcollins.com>
References: <1538447849-46511-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1538447849-46511-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20181009101528.2d7532c6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 Oct 2018 21:37:29 -0500, Matt Weber wrote:
> Adds a pool of worker threads to accelerate connection testing.
> 
> ~7.5MB and 2% CPU per thread on a Intel i5-3230M CPU @ 2.60GHz.
> 
> Runtime is ~3min in parallel vs ~15min.
> 
> CC: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> 
> ---
> Changes
> v2 -> v3
> [Ricardo
>  - Updated the timeout for header request testing to 30sec as there
>    maybe corner cases with a smaller value when running requests in
>    parallel on a busy machine

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
