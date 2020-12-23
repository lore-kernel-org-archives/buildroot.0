From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 22:30:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/netsnmp: fix memory leak in
 IP-MIB when running without IPv6
In-Reply-To: <1Xo9xihl1qAi9-3z-mGRWT1Q3ZMOVJmNN2ek_8uuL58OXoVEap5pmvAEbu0zqqWXpeN0nvk6uZg85ZJZf1zRENPU38-isMll7nhtdq3l4Hs=@wujek.eu>
 (wujek dev's message of "Wed, 23 Dec 2020 18:11:36 +0000")
References: <1608549912-29585-1-git-send-email-dev_public@wujek.eu>
 <87lfdokiti.fsf@dell.be.48ers.dk>
 <1Xo9xihl1qAi9-3z-mGRWT1Q3ZMOVJmNN2ek_8uuL58OXoVEap5pmvAEbu0zqqWXpeN0nvk6uZg85ZJZf1zRENPU38-isMll7nhtdq3l4Hs=@wujek.eu>
Message-ID: <87tuscfbx8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "wujek" == wujek dev <dev_public@wujek.eu> writes:

 >> This function is only called once, right?
 > Unfortunately not. The bug fixed in this commit causes a leak of 356 bytes every 60 seconds!
 > To hit this problem your system has to fulfil the following:
 > --Linux system with no IPv6 support (precisely, no /proc/net/snmp6 file in the system)
 > --included IP-MIB in the netsnmp

 > The leak also happens when snmp queries are not performed.

Ok :/

 > Note: in netsnmp 5.7.3 there is an option for configure
 > "--enable-ipv6", even without this option enabled the bug show up. In
 > 5.8 the option is contrary "--disable-ipv6", but I haven't checked if
 > the problem is when the disable of ipv6 is activated. For sure the
 > leak happens if netsnmp is compiled with ipv6 support, but there is no
 > such support by a Linux kernel.
 > In 5.9 this problem is fixed.

 > IMHO: this patch should be pushed to all maintenance branches. Would
 > you like to send such patch (with appropriate header) to this mailing
 > list?

Don't worry, I'll take care of backporting it myself.

-- 
Bye, Peter Korsgaard
