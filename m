From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 23 Oct 2017 10:26:16 +0000
Subject: [Buildroot] git clone https://git.busybox.net/buildroot works
	unexpectedly slow
Message-ID: <4881796E12491D4BB15146FE0209CE6467FA4405@DE02WEMBXB.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Probably that's just me but could anyone please try if access to BR git repo via HTTPS
really works OK?
--------------------------------->8-------------------------------
$ time git clone https://git.busybox.net/buildroot
Cloning into 'buildroot'...
Checking connectivity... done.
Checking out files: 100% (9694/9694), done.

real    15m59.868s
user    1m56.969s
sys     5m16.609s

$ time git clone https://git.busybox.net/buildroot
Cloning into 'buildroot'...
error: Unable to find ba0bf240915229e94c0565b833be6ac273a4776d under https://git.busybox.net/buildroot
Cannot obtain needed blob ba0bf240915229e94c0565b833be6ac273a4776d
while processing commit 6bb75e43a42cddfa0a9e6e001d8d0224f124a64a.
error: Fetch failed.

real    8m8.317s
user    0m0.000s
sys     0m5.391s
--------------------------------->8-------------------------------

Note, via git it works as expected.

-Alexey
