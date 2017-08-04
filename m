From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Aug 2017 23:42:59 +0200
Subject: [Buildroot] [PATCH 08/10] libssl: fix make files for libressl
In-Reply-To: <20170804185521.12320-9-Adamduskett@outlook.com>
References: <20170804185521.12320-1-Adamduskett@outlook.com>
 <20170804185521.12320-9-Adamduskett@outlook.com>
Message-ID: <14c98b55-b9a4-fdd2-5fcd-edc2495e3a17@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-08-17 20:55, Adam Duskett wrote:
> Two packages need a slight change to get them to build with libressl.
> 
> ca-certificates uses the c_rehash script from openssl to create
> symlinks to the certificates by their hash value.
> LibreSSL moved this functionality into the openssl binary itself.

 I may be confused by the patches in flight (though apparently you've removed
everything pending from patchwork), but as far as I understand, we always use
host-openssl and never host-libressl, so this isn't relevant, right?

> mosquitto has tls_psk enabled by default, which libressl does not support.
> This is fixed with passing WITH_TLS_PSK=no to the make opts.

 For consistency we should probably also have WITH_TLS_PSK=yes in the other case.

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
