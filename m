From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Dec 2020 09:37:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/netsnmp: fix memory leak in
 IP-MIB when running without IPv6
In-Reply-To: <1608549912-29585-1-git-send-email-dev_public@wujek.eu> (Adam
 Wujek's message of "Mon, 21 Dec 2020 11:25:34 +0000")
References: <1608549912-29585-1-git-send-email-dev_public@wujek.eu>
Message-ID: <878s9nfvl3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Wujek <dev_public@wujek.eu> writes:

 > In a Linux system without IPv6 support (or booted with "ipv6.disable=1")
 > file /proc/net/snmp6 is not present. If such file is not present an allocated
 > memory is not freed. Memory leak occurs even without snmp queries.

 > Problem seen at least since netsnmp 5.7.3 (probably even v5.6.1).
 > Patch backported from netsnmp 5.9, where the problem does not appear any more.

 > Signed-off-by: Adam Wujek <dev_public@wujek.eu>

Committed to 2020.02.x, 2020.08.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
