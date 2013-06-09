From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 09 Jun 2013 09:32:46 -0300
Subject: [Buildroot] [PATCH] libpcap: fix build failure related to libnl3
In-Reply-To: <1370771136-1443-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1370771136-1443-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <51B475EE.3090503@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/09/2013 06:45 AM, Thomas Petazzoni wrote:

> When libpcap detects that libnl3 is available, it hardcodes the fact
> of using -I/usr/include/libnl3, which is completely wrong in
> cross-compilation.
> 
> This commit fixes that, by removing this hardcoded include path, and
> by passing an appropriate -I option from libpcap.mk.
> 
> The original issue has been reported upstream at
> https://github.com/the-tcpdump-group/libpcap/issues/305.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/b65/b6585bf2985a188e797e5a6b71a35c461421e3b4/build-end.log
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

On a gentoo host (desktop) there are plenty of headers hence this went
unnoticed by myself.
