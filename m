From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Mar 2016 23:54:59 +0100
Subject: [Buildroot] [PATCH] package/cups: fix static linking with GnuTLS
In-Reply-To: <20160228230022.3d8805d6@free-electrons.com>
References: <1456675640-22176-1-git-send-email-joerg.krause@embedded.rocks>
 <20160228230022.3d8805d6@free-electrons.com>
Message-ID: <56D61DC3.8090502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/28/16 23:00, Thomas Petazzoni wrote:
> This is normally fixed with pkg-config by using the Libs.private field,
> but here we are *inside* a given package, so the pkg-config files have
> not yet been installed by the time we link the cups binaries.
> 
> I think this problem is normally handled by libtool, but since cups is
> using only autoconf and not automake/libtool... Maybe we should consult
> with the cups developers?

 Well, inside a package, it's the responsibility of the package build system to
link with all required libraries (in the required order). That can either be
handled by a helper like libtool, or the Makefile should handle it manually.

 In other words: I beliver Joerg's fix is the correct one.

 Regards,
 Arnout

> 
> Arnout, Yann, do you have other advises?


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
