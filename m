From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Mar 2017 22:34:04 +0100
Subject: [Buildroot] [PATCH v2 2/2] Makefile: add check of binaries
 architecture
In-Reply-To: <aa76136f-f6cb-0746-319c-c71f0812cc26@mind.be>
References: <1489340983-11806-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1489340983-11806-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <aa76136f-f6cb-0746-319c-c71f0812cc26@mind.be>
Message-ID: <6a33d082-66fb-9d4f-ad48-40f0a055660b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 I forgot to mention this:

> +    # Get architecture using readelf
> +    farchname=$(${TARGET_CROSS}readelf -h ${f} | \

 Since this is the only use of TARGET_CROSS, it would make more sense to pass
TARGET_READELF.

 We could even use the host readelf, except I'm not sure that older readelf
binaries know about newish architectures like ARC. Trying with an old 2.20
binary... Right, it *can* read an ARC file, but it reports
  Machine:                           <unknown>: 0xc3

 So, pass TARGET_READELF.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
