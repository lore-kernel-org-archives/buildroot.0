From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Nov 2017 14:04:43 +0100
Subject: [Buildroot] [PATCH] wireguard: bump to version 0.0.20171111
In-Reply-To: <20171113221401.26694-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 13 Nov 2017 23:14:01 +0100")
References: <20171113221401.26694-1-peter@korsgaard.com>
Message-ID: <871sl12eqc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Contains a number of important fixes. From the relase notes:
 > https://lists.zx2c4.com/pipermail/wireguard/2017-November/001935.html

 >   * netlink: plug memory leak
 >   * qemu: check for memory leaks

 >   There was a small memory leak on the netlink configuration layer that's now
 >   been fixed.

 >   * netlink: make sure we reserve space for NLMSG_DONE

 >   A rather important change - due to an upstream kernel bug, that's existed
 >   since the advent of netlink itself, sometimes wg(8) failed to receive valid
 >   data back from kernelspace, resulting in "ENOBUFS" when trying to dump all
 >   peers. This patch works around it while we wait for upstream to commit the
 >   fix.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 >  package/wireguard/wireguard.hash | 4 ++--
 >  package/wireguard/wireguard.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 3 deletions(-)

Committed, thanks.

-- 
Bye, Peter Korsgaard
