From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Mar 2020 21:37:05 +0100
Subject: [Buildroot] [PATCH] package/util-linux: disable systemd for
 host build
In-Reply-To: <20200219112559.1429304-1-john@metanate.com> (John Keeping's
 message of "Wed, 19 Feb 2020 11:25:59 +0000")
References: <20200219112559.1429304-1-john@metanate.com>
Message-ID: <871rq3yk9a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "John" == John Keeping <john@metanate.com> writes:

 > When building host-util-linux, the systemdsystemunitdir is set to the
 > real host directory, so the install step fails with:

 > /usr/bin/install: cannot remove '/usr/lib/systemd/system/fstrim.service': Permission denied
 > /usr/bin/install: cannot remove '/usr/lib/systemd/system/fstrim.timer': Permission denied

 > Since we don't need systemd support in host-util-linux, unconditionally
 > disable it for the host build.

 > Signed-off-by: John Keeping <john@metanate.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
