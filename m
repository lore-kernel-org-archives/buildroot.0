From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Dec 2013 11:32:53 +0100
Subject: [Buildroot] [PATCH 1/5] coreutils: belongs to system tools,
	not development
In-Reply-To: <529DAFA0.9030903@zacarias.com.ar> (Gustavo Zacarias's message of
 "Tue, 03 Dec 2013 07:17:04 -0300")
References: <1707580650.15811727.1386058098089.JavaMail.root@openwide.fr>
 <529DAFA0.9030903@zacarias.com.ar>
Message-ID: <87pppens16.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > On 12/03/2013 05:08 AM, Jeremy Rosen wrote:
 >> I personally don't know exactly what busybox provides, this option is
 >> a simple way to make sure I don't compile any useless stuff...
 >> 
 >> I'm in favor of keeping it or provide another way to find duplicates

 > Sometimes the busybox version is short of features and you need the full
 > version even when keeping busybox around.

Exactly, like we're hiding bash/zsh even though the differences from
busybox ash are pretty huge. Same for syslogd/sysvinit or vim.

 > With that being said you sometimes want to avoid the opposite too. On
 > this patchset i've found there are many of the big packages required
 > (and needed fixing) to get a nice (no warnings or error messages)
 > booting system with the default skeleton, OTOH: coreutils, util-linux,
 > some shell (bash), sysvinit, sysklogd, linux-pam (inherent for util-linux).
 > And with those we still get a warning from util-linux's hostname not
 > being feature complete (oh the irony, busybox hostname is, we need
 > net-tools to replace it).
 > And we're still lacking ifup/ifdown :)

Which relate to the point about these options not getting a lot of
testing.

-- 
Bye, Peter Korsgaard
