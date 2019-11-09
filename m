From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 9 Nov 2019 17:11:20 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-11-02
In-Reply-To: <20191103071617.28D8A8A8D3@whitealder.osuosl.org>
References: <20191103071617.28D8A8A8D3@whitealder.osuosl.org>
Message-ID: <20191109161120.GB26889@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 2019-11-03 07:16, Thomas Petazzoni wrote:

> Detail of failures
> ------------------
[...]
>
>   aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/5de37d3da17ca5cb17c0113d942ce8c22c0074e0 |
>     arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/41b00d95ec4eb851abceaa7919aa1c533d4f16e8 |
>     arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/119e22e8b03991ab9196e428a131f5a8ae2a2b2f |

These errors are related to SSP: modifying the Makefile to pass
"-fno-stack-protector" to CFLAGS solves the issue. I'll send a patch.

Regards,

--
ELB
