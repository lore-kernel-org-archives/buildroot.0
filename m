From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 Jul 2015 18:03:00 -0300
Subject: [Buildroot] [PATCH] Update from polarssl to mbed 1.3.11
In-Reply-To: <1437080329-96500-1-git-send-email-eswierk@skyportsystems.com>
References: <1437080329-96500-1-git-send-email-eswierk@skyportsystems.com>
Message-ID: <55A81C04.9020605@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/07/15 17:58, Ed Swierk wrote:

> This patch updates the polarssl package to build the current mbed 1.3.x
> release.
>
> It also prefixes the generated binaries with mbed_, to avoid names that
> overlap with other packages (like sha1sum) or that are generic and
> confusing (like selftest or hello).

And breaks at least openvpn in the process since 1.2.x and 1.3.x are API 
incompatible (also Hiawatha but a bump would fix that).
I didn't test rtmpdump or shairport-sync for breakage.
So there's more to do than just bump (there's no openvpn release 
compatible with 1.3.x, that's scheduled for the 2.4.x branch).
Regards.
