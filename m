From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Jul 2018 00:19:08 +0200
Subject: [Buildroot] [PATCH v3 1/6] tini: new package
In-Reply-To: <CA+h8R2oxXWWnPT8dnn0Bt4UL=JA8SGjDg3vCyZNNchrPCaWJ+w@mail.gmail.com>
References: <20180715010732.21765-1-christian@paral.in>
 <20180715010732.21765-7-christian@paral.in> <20180715160129.GF2516@scaer>
 <CA+h8R2oxXWWnPT8dnn0Bt4UL=JA8SGjDg3vCyZNNchrPCaWJ+w@mail.gmail.com>
Message-ID: <f5bb48b8-d69b-bf4f-cbd7-59b98f577ab7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-07-18 21:26, Christian Stewart wrote:
> To me, the logic goes, if you're doing a static build, you can't build a shared
> binary. If you're doing a shared build, you can always build a static binary. Is
> this not the case?

 The toolchains always install libc.a (and libm.a too, I think). So as long as
you use _only_ libc.a, you can do a static link even in BR2_SHARED_LIBS. But as
soon as you use anything else (in particular, in the case of glibc, libnss which
gets pulled in automatically if you use some getnameinfo related function), it's
no longer possible to link statically.

 So yes, it is possible to link some individual packages statically even in
BR2_SHARED_LIBS.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
