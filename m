From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 27 Jul 2014 02:49:46 +0400
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-07-24
In-Reply-To: <20140725063012.8107D1015AE@stock.ovh.net>
References: <20140725063012.8107D1015AE@stock.ovh.net>
Message-ID: <CAMo8BfJ96eqY5hHU-Y8=MPAP48DbC6=tYZ90c0r7FgtoVGYjGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 25, 2014 at 10:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2014-07-24
>     xtensa |       network-manager-0.9.10.0 | NOK | http://autobuild.buildroot.net/results/d33ed1c3bf1be7c8f8ea02590a770b0d29c7d9fa/

It fails with

NetworkManagerUtils.c:1020:23: error: 'CLOCK_BOOTTIME' undeclared
(first use in this function)
  err = clock_gettime (CLOCK_BOOTTIME, tp);

because there's no CLOCK_BOOTTIME in uClibc.
Not sure what's the proper fix for that, adding support for
CLOCK_BOOTTIME into uClibc?
(looks fairly easy). Or just disabling network manager on uClibc?

-- 
Thanks.
-- Max
