From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 Dec 2017 22:47:08 +0100
Subject: [Buildroot] [PATCH] traceroute: new package
In-Reply-To: <20171216160636.028739fe@windsurf> (Thomas Petazzoni's message of
 "Sat, 16 Dec 2017 16:06:36 +0100")
References: <1513429309-16761-1-git-send-email-sergio.prado@e-labworks.com>
 <20171216160636.028739fe@windsurf>
Message-ID: <874loqgxb7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sat, 16 Dec 2017 11:01:49 -0200, Sergio Prado wrote:

 >> +define TRACEROUTE_INSTALL_TARGET_CMDS
 >> +	$(RM) -f $(TARGET_DIR)/usr/bin/traceroute

 > I didn't see why this is needed. The package does a simple "cp", so
 > reinstallation works fine. So I've dropped this.

Yes, but plain cp follows symlinks, so it ends up overwriting the
bin/busybox binary, breaking the build.

So we either need this workaround or pass INSTALL=$(INSTALL) to make to
get it to use install instead of cp.

-- 
Bye, Peter Korsgaard
