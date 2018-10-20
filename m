From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 18:59:53 +0200
Subject: [Buildroot] [git commit] netsnmp: fix static build failure due
 to missing -lssl and -lz
In-Reply-To: <20181011204516.D4311835D7@busybox.osuosl.org> (Peter Korsgaard's
 message of "Thu, 11 Oct 2018 22:26:42 +0200")
References: <20181011204516.D4311835D7@busybox.osuosl.org>
Message-ID: <87ftx0a706.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=13722d58f77d0e9fea9eefc50bf083d19f835433
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > During configure some checking needing -lssl and -lz don't have them
 > appended to linker tail. Since we are building static this leads to
 > configure failure because of mandatory functions lack produces:
 > "configure: error: The DTLS based transports require the libssl library
 > from OpenSSL to be available and support DTLS"

 > - Add 1 patch to fix -lssl lack in configure and .ac modules:
 > upstreamed: https://sourceforge.net/p/net-snmp/code/ci/bd59be8e4e339870a1400f6866a7b73ca11f6460/
 > - Add 2 patches to fix -lz lack in configure and .ac modules:
 > 1 upstreamed: https://sourceforge.net/p/net-snmp/code/ci/13da2bcde8e22dd0127a668374fdf79bed04d353/
 > 1 in Merge Request: https://sourceforge.net/p/net-snmp/code/merge-requests/19/
 > - Add NETSNMP_AUTORECONF = YES

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
