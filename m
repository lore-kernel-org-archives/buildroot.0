From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 20 Oct 2015 22:50:58 +1300
Subject: [Buildroot] syslog-ng build failures
Message-ID: <CAFOYHZA=ujev-79kRHw7sFN9hRAikGsXtTC+fJbhyyMyFcFmTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've sent patches for some of the syslog-ng failures. The last one is
http://autobuild.buildroot.net/results/137/137c6d5ef82f3a92f87bc2b3e285df548ca68654/

This appears to be because posix_spawnp and the others aren't
available with that configuration of uclibc (although it looks like
UCLIBC_HAS_ADVANCED_REALTIME is defined).

I could add --disable-amqp if we're using uclibc but that seems overly
severe. Any better suggestions?
