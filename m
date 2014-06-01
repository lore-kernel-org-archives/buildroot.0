From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 01 Jun 2014 09:44:56 -0300
Subject: [Buildroot] [PATCHv2] mpg123: use code optimized for ARM NEON
 SIMD engine if available
In-Reply-To: <1401626541-11036-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1401626541-11036-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <538B2048.60204@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/01/2014 09:42 AM, Thomas Petazzoni wrote:

> From: Sven Neumann <neumann@teufel.de>
> 
> [Thomas: as suggested by Peter, enable NEON as soon as NEON is
> available, not necessarily when NEON is used as the default FPU. Note
> that this requires passing -mfpu=neon to build mpg123, so that for
> this specific package, the NEON unit is used as the FPU.]
> 
> Signed-off-by: Sven Neumann <neumann@teufel.de>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

It might be better to look at the new mpg123 release that does ARM
optimizations in a different (and possibly incompatible) way.
1.20.0 for Aarch64, 1.19.0 for ARM (--with-cpu for configure).
Regards.
