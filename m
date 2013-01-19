From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Jan 2013 11:21:24 +0100
Subject: [Buildroot] [git commit] openvpn: fix init script name
In-Reply-To: <87mww9mu8k.fsf@dell.be.48ers.dk>
References: <20130115204907.6290399699@busybox.osuosl.org>
 <CAJJ6jxukk2pGwL9Y3US7W0u488jKk52EgB4LJcnF4uUtQN66Lg@mail.gmail.com>
 <87mww9mu8k.fsf@dell.be.48ers.dk>
Message-ID: <50FA73A4.4080304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/01/13 09:01, Peter Korsgaard wrote:
> You could argue that we should make the order somewhere between 45
> (networkmanager/connman) and 50 (network servers) so you could make the
> network servers listen on the vpn interface.

  It sounds logical that VPN is started before the network servers.

  OTOH most servers listen on all interfaces anyway so it shouldn't make 
a difference.

  And anyway, the openvpn --daemon will exit immediately, long before the 
new tun/tap interface actually appears. So it makes no sense to consider 
anything to depend on openvpn.

  On Debian, openvpn depends on network, nfs-client and syslog, and is 
started before X. Cups and samba are started after openvpn, but ftpd, 
apache and exim4 are started before.

  Bottom line: keep it as it is, since it doesn't make a big difference.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
