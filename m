From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 22:50:51 +0100
Subject: [Buildroot] [PATCH 2/2] package/network-manager: Add upstream
 patch to fix CVE-2018-15688
In-Reply-To: <20181030212053.9833-2-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Tue, 30 Oct 2018 22:20:53 +0100")
References: <20181030212053.9833-1-bernd.kuhls@t-online.de>
 <20181030212053.9833-2-bernd.kuhls@t-online.de>
Message-ID: <878t2fcddw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > NetworkManager includes some parts of the systemd-networkd code in its
 > codebase. That can be found at src/systemd/src/libsystemd-networkd.
 > The DHCP implementation provided by systemd-networkd is used when
 > NetworkManager is configured to use the internal implementation,
 > however the default is to use dhclient.

 > When NetworkManager is configured to use the internal dhcp and an
 > interface is setup with ipv6.method=auto (which is the default value)
 > or ipv6.method=dhcp, this flaw can be exploited. When using
 > ipv6.method=auto, the DHCPv6 client can be automatically started with a
 > Router Advertisement packet.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
