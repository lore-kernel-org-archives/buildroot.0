From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Nov 2016 21:40:39 +0100
Subject: [Buildroot] [PATCH] stella: fix bug when compiling with PPC
 altivec vectorization
In-Reply-To: <1479404832-11783-1-git-send-email-sergio.prado@e-labworks.com>
References: <1479404832-11783-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <1f1deabc-84e7-3535-83d0-778568c9d138@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-11-16 18:47, Sergio Prado wrote:
> Acording to a bug report in GCC [1], "You need to use -std=g++11 or
> undefine bool after the include of altivec.h as context sensitive
> keywords is not part of the C++11 standard".
> 
> So let's compile with -std=gnu++11 when PPC altivec is enabled.

 So this is the second package that requires this kind of hack. I wonder if we
shouldn't try to fix this globally in the toolchain wrapper. Like, search for
'--std=c++' in the arguments and replace it with '--std=gnu++' (while conserving
the numbers behind the ++, so not entirely trivial...).


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
