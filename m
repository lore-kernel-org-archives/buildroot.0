From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 27 Nov 2015 14:03:09 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-11-26
In-Reply-To: <20151127073014.F0A24102391@stock.ovh.net>
References: <20151127073014.F0A24102391@stock.ovh.net>
Message-ID: <1448629389.16816.4.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fr, 2015-11-27 at 08:30 +0100, Thomas Petazzoni wrote:
> Build statistics for 2015-11-26
> ===============================
> 
> Detail of failures
> ===================
> 
> ?????????arm |????????????????arptables-0.0.4 | NOK | http://autobuil
> d.buildroot.net/results/b721e4fa24a0728c20fd2ec0663c2b5981387642/

I had a look at this. Build fails because of namespace collision
between netinet and linux headers, e.g IPPROTO_IP is both defined in
linux/in.h and?netinet/in.h.

Unfortunatly, I am not sure how to fix this properly.

Best regards
J?rg Krause
