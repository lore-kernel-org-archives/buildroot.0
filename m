From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Apr 2015 21:54:50 +0200
Subject: [Buildroot] [PATCH v1] dhcpcd: fix ipv6 related compile failure
In-Reply-To: <1430249788-4060-1-git-send-email-ps.report@gmx.net> (Peter
 Seiderer's message of "Tue, 28 Apr 2015 21:36:28 +0200")
References: <1430249788-4060-1-git-send-email-ps.report@gmx.net>
Message-ID: <87vbggxc39.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add '-D_GNU_SOURCE' to gain missing struct in6_pktinfo definition.
 > Fixes [1]:

 > ipv6.h:211:41: error: invalid application of 'sizeof' to incomplete type 'struct in6_pktinfo'
 >   unsigned char sndbuf[CMSG_SPACE(sizeof(struct in6_pktinfo))];
 >                                          ^
 > ipv6.h:195:38: error: invalid application of 'sizeof' to incomplete type 'struct in6_pktinfo'
 >  #define IP6BUFLEN (CMSG_SPACE(sizeof(struct in6_pktinfo)) + \
 >                                       ^
 > ipv6.h:214:23: note: in expansion of macro 'IP6BUFLEN'
 >   unsigned char rcvbuf[IP6BUFLEN];

 > [1] http://autobuild.buildroot.net/results/523/523858fb930e74fe28f24989ff0697693b5fdd67

Bernd sent a similar patch:

http://patchwork.ozlabs.org/patch/462596/

But this is imho nicer than patching the source, so I've applied this
and marked that patch as superseed.

Thanks both!

-- 
Bye, Peter Korsgaard
