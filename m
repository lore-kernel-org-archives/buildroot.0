From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Jun 2018 23:03:48 +0200
Subject: [Buildroot] [PATCH] fs: allow extra arguments to common tarball
 extraction
In-Reply-To: <20180606185136.GA2537@scaer>
References: <20180603022145.14222-1-casantos@datacom.com.br>
 <20180605172345.GB29058@scaer>
 <625048322.1426556.1528289177741.JavaMail.zimbra@datacom.com.br>
 <20180606185136.GA2537@scaer>
Message-ID: <81235112-f5f8-dbed-ac99-7942c003b898@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-06-18 20:51, Yann E. MORIN wrote:
> But my position has always been consistent on this topic: the images
> that Buildroot generates only ever covers just "basic" situations, using
> a single-filesystem layout. Anything that needs to do a multi-filesystem
> layout should be done as a new filesystem. Doing it in a new filesystem
> is much more flexible than whatever kconfig option we may ever add. And
> since we already have this wonderful flexibility, I don't think it makes
> sense to add a new option that duplicates only a very limited subset of
> that flexibility. That duplication is not good, IMNSHO...

 There is (in my even less humble opinion) one way that we can solve this
generically: by adding a genimage filesystem. genimage is able to create
separate filesystem images for subtrees. so it can cover many use cases in a
generic way.

 There are probably a few gotchas, but I still believe it should be possible.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
