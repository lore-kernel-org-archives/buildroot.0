From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Oct 2017 22:46:18 +0200
Subject: [Buildroot] [PATCH 00/13] Turn OpenSSL into a virtual package
In-Reply-To: <20171021213345.3e20e080@windsurf>
References: <20171018023240.22724-1-Adamduskett@outlook.com>
 <20171021213345.3e20e080@windsurf>
Message-ID: <965ea900-44e9-3e92-d8ca-9152cab097d7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-10-17 21:33, Thomas Petazzoni wrote:
>  - We were not happy with carrying all those patches to make those
>    packages compatible with LibreSSL, so instead we made them depend on
>    libopenssl only.

 Let me clarify our reasoning for this.

 First of all, patching packages to support libressl is borderline a feature patch.

 Second, I'm not sure that the patches that add ||
defined(LIBRESSL_VERSION_NUMBER) are entirely acceptable upstream. The issue is
that as soon as libressl does support the OpenSSL 1.1.0 APIs, the condition is
not correct anymore and it becomes rather complicated to make it correct. So at
least we would want upstream feedback on these patches before we accept them in
Buildroot.

 And finally, all those packages don't strictly depend on openssl anyway, they
only optionally use it. So if they don't support libressl it isn't that critical.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
