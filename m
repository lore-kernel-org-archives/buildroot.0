From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Nov 2015 16:20:35 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-11-26
In-Reply-To: <1448629389.16816.4.camel@embedded.rocks>
References: <20151127073014.F0A24102391@stock.ovh.net>
 <1448629389.16816.4.camel@embedded.rocks>
Message-ID: <20151127162035.49cabe73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Fri, 27 Nov 2015 14:03:09 +0100, J?rg Krause wrote:

> > ?????????arm |????????????????arptables-0.0.4 | NOK | http://autobuil
> > d.buildroot.net/results/b721e4fa24a0728c20fd2ec0663c2b5981387642/
> 
> I had a look at this. Build fails because of namespace collision
> between netinet and linux headers, e.g IPPROTO_IP is both defined in
> linux/in.h and?netinet/in.h.
> 
> Unfortunatly, I am not sure how to fix this properly.

That's a typical case of issue exhibited by musl. You can probably just
remove the <linux/in.h> include completely.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
