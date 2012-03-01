From: Steve Calfee <stevecalfee@gmail.com>
Date: Wed, 29 Feb 2012 16:52:20 -0800
Subject: [Buildroot] Buildroot 2012.02-rc3 released
In-Reply-To: <201203010017.12296.arnout@mind.be>
References: <87ehtg2r6n.fsf@macbook.be.48ers.dk>
 <201203010037.49778.yann.morin.1998@free.fr>
 <CAJJ6jxv1JvMsK7pMgQJ85DHDiz=on8zO3Mux0KigJHpq-a3_ZQ@mail.gmail.com>
 <201203010017.12296.arnout@mind.be>
Message-ID: <CAJJ6jxvuCDspQ7eFe=1-=Zp00PygaFcXkyNh20sPsiAN77h3zQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 29, 2012 at 4:17 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Wednesday 29 February 2012 23:48:36 Steve Calfee wrote:
>> Both systems sit on a NAT LAN with 192.168* ip addresses. I don't know
>> if that affects things, shouldn't.
>
> ?It will. ?The DNS on the NAT will cache the authoritive server for
> uclibc.org. ?If the original uclibc.org DNS server still replies to DNS
> requests, but doesn't give answers for uclibc.org addresses, then the NAT
> will not look further. ?You can verify this by issuing
>
> host -v -t SOA uclibc.org
>
> which should reply
>
> uclibc.org. ? ? ? ? ? ? 86125 ? IN ? ? ?SOA ? ? ns1.auth.osuosl.org. hostmaster.osuosl.org. 1330554603 300 900 604800 86400
>
> but will probably reply with the old DNS server.
>
> ?There is unfortunately no way to force your NAT to forget the cached
> record. ?You can try to NOT access any uclibc.org site for 48 hours,
> which may expire the cache.
>
I did what you suggested, But I don't know if the differences are important:
me:~$ host -v -t SOA uclibc.org
Trying "uclibc.org"
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 64103
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; QUESTION SECTION:
;uclibc.org.			IN	SOA

;; ANSWER SECTION:
uclibc.org.		86400	IN	SOA	ns1.auth.osuosl.org. hostmaster.osuosl.org.
1330554603 300 900 604800 86400

;; ADDITIONAL SECTION:
ns1.auth.osuosl.org.	67451	IN	A	140.211.166.140

Received 107 bytes from 192.168.3.31#53 in 305 ms
