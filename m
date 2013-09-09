From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 09 Sep 2013 11:33:11 +0200
Subject: [Buildroot] [PATCH v3 1/1] change package tarball compression
	to xz whenever possible
In-Reply-To: <20130909092425.6a16e694@skate> (Thomas Petazzoni's message of
 "Mon, 9 Sep 2013 09:24:25 +0200")
References: <1378448055-3056-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <20130909092425.6a16e694@skate>
Message-ID: <8761uaxru0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Peter,
 Thomas> On Fri,  6 Sep 2013 08:14:15 +0200, Jerzy Grzegorek wrote:
 >> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>

 Thomas> I've seen you committed this patch, but unfortunately it breaks all
 Thomas> Github downloads. It assumes Github provides a .tar.xz file, but it
 Thomas> doesn't: even if you request a .tar.xz file from Github, it gives you a
 Thomas> gzip compressed file:

 Thomas> $ wget http://github.com/gandro/input-event-daemon/tarball/v0.1.3/input-event-daemon-v0.1.3.tar.xz
 Thomas> [...]
 Thomas> $ file input-event-daemon-v0.1.3.tar.xz 
 Thomas> input-event-daemon-v0.1.3.tar.xz: gzip compressed data, from Unix

 Thomas> This is causing a huge number of build failures in the autobuilders.
 Thomas> For example, cpuload:
 Thomas> http://autobuild.buildroot.org/results/bcd/bcdf4bdca4d5f8ffc9c84afcadf1b057fc03e009/build-end.log.

Argh :/

I did test a few packages, but apparently none using github.

 Thomas> So I believe this patch should be reverted, or at least the parts
 Thomas> affecting Github downloads.

I'll revert the github parts.

-- 
Bye, Peter Korsgaard
