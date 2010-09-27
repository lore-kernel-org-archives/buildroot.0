From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Mon, 27 Sep 2010 23:46:52 +0200
Subject: [Buildroot] [PATCH] introducing transmission bittorrent client
In-Reply-To: <AANLkTi=D9f0qz=DsgeX-hwZPwxvSsp-nncS+r0BiqP0y@mail.gmail.com>
References: <1284884604-2433-1-git-send-email-marcus.osdoba@googlemail.com>
	<4C95DD81.2090105@googlemail.com>
	<AANLkTi=D9f0qz=DsgeX-hwZPwxvSsp-nncS+r0BiqP0y@mail.gmail.com>
Message-ID: <4CA110CC.8030009@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Am 21.09.2010 04:00, schrieb Kelvin Cheung:
> Hi Marcus,
>
> I have tried the patch.
> It works fine.
Hi Kelvin,

I don't know why, but the transmission daemon is not able to create the 
temporary torrent and resume file.
All other config files were written without problems in the given 
config-dir. I haven't forwarded a specific port to the machine where 
embedded transmission runs on - until now.
Why won't transmssion write the temporary files? Or is it correct 
behaviour? I'm confused about "Couldn't save & Success" in the same 
status line.

Did you encounter similar errors with your installation?

Btw: Thomas preferres another solution for the init-d skript (without 
sleep 5 init). I wasn't able to figure out clearly, why and where the 
IP_ADDR variable is used, so I'm experimenting with the "official" 
init-d-skript from the transmission wiki.
Would this be a problem in your eyes?

Kind regards,
Marcus


$ /usr/bin/transmission-daemon -f -a 192.168.1.* --config-dir=/data
[23:32:24.095] Transmission 2.04 (11151) started (session.c:622)
[23:32:24.097] RPC Server Adding address to whitelist: 192.168.1.* 
(rpc-server.c:767)
[23:32:24.100] RPC Server Serving RPC and Web requests on port 9091 
(rpc-server.c:940)
[23:32:24.102] RPC Server Whitelist enabled (rpc-server.c:944)
[23:32:24.104] DHT Generating new id (tr-dht.c:378)
[23:32:24.106] Port Forwarding (NAT-PMP) initnatpmp succeeded (0) 
(natpmp.c:67)
[23:32:24.108] Port Forwarding (NAT-PMP) sendpublicaddressrequest 
succeeded (2) (natpmp.c:67)
[23:32:24.110] Using settings from "/data" (daemon.c:443)
[23:32:24.113] Saved "/data/settings.json" (bencode.c:1651)
[23:32:25.116] Port Forwarding (UPnP) Found Internet Gateway Device 
"http://192.168.1.1:49000/upnp/control/WANIPConn1" (upnp.c:113)
[23:32:25.118] Port Forwarding (UPnP) Local Address is "192.168.1.254" 
(upnp.c:115)
[23:32:25.120] Port Forwarding (UPnP) Port forwarding through 
"http://192.168.1.1:49000/upnp/control/WANIPConn1", service 
"urn:schemas-upnp-org:service:WANIPConnection:1".  (local address: 
192.168.1.254:51413) (upnp.c:202)
[23:32:25.123] Port Forwarding State changed from "Not forwarded" to 
"Starting" (port-forwarding.c:89)
[23:32:31.126] Port Forwarding State changed from "Starting" to "???" 
(port-forwarding.c:89)
[23:32:59.130] DHT Attempting bootstrap from dht.transmissionbt.com 
(tr-dht.c:234)
[23:33:16.135] Couldn't save file 
"/data/torrents/evbarmcd-5.0.2.iso.9fe3ef5b5a32e862.torrent": Success 
(bencode.c:1663)
[23:33:34.139] evbarmcd-5.0.2.iso Starting DHT announce (poor, 9 nodes) 
(tr-dht.c:669)
[23:34:23.146] Couldn't save file 
"/data/resume/evbarmcd-5.0.2.iso.9fe3ef5b5a32e862.resume": Success 
(bencode.c:1663)
[23:35:04.151] evbarmcd-5.0.2.iso Removing torrent (torrent.c:1557)
[23:35:04.154] evbarmcd-5.0.2.iso Pausing (torrent.c:1513)
Closing transmission session... done.
