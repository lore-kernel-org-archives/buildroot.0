From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Sep 2017 00:41:14 +0200
Subject: [Buildroot] [PATCH] package/asterisk: fix host build
In-Reply-To: <20170924163301.10853-1-yann.morin.1998@free.fr>
References: <20170924163301.10853-1-yann.morin.1998@free.fr>
Message-ID: <c3ba3470-ce43-af1a-c653-278adc64d633@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-09-17 18:33, Yann E. MORIN wrote:
> The host menuselect tool is linked to our host libxml2 library, but it
> is missing an RPATH to the host directory.
> 
> This is because menuselect does not use automake, so does not inherit
> the LDFLAGS from the configure run.
> 
> We fix that by simply passing $(HOST_CONFIGURE_OPTS) in the make
> environment.
> 
> At the same time, we also install the tool in the host directory, even
> if not used from there, so that the sanity checks we run are properly
> passed.

 I think this is a bit over the top, but oh well.

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>

 Applied to master, thanks.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
