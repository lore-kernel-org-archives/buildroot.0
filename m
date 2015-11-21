From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Nov 2015 00:54:56 +0100
Subject: [Buildroot] [PATCH 1/1] ustr: fix build issue with GCC5
In-Reply-To: <1448134108-10089-1-git-send-email-sergio.prado@e-labworks.com>
References: <1448134108-10089-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <56510450.1040106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21-11-15 20:28, Sergio Prado wrote:
> This patch fixes the following error messages:
> 
> ustr-cmp-code-so-dbg.o: In function `ustr_pool_make_subpool':
> ustr-cmp-dbg-code.c:(.text+0x0): multiple definition of
> `ustr_pool_make_subpool'
> ustr-b-code-so-dbg.o:ustr-b-dbg-code.c:(.text+0x0): first defined here
> ustr-cmp-code-so-dbg.o: In function `ustr_pool_clear':
> ustr-cmp-dbg-code.c:(.text+0x44): multiple definition of
> `ustr_pool_clear'
> ustr-b-code-so-dbg.o:ustr-b-dbg-code.c:(.text+0x44): first defined here
> ustr-cmp-code-so-dbg.o: In function `ustr_pool_free':
> ...
> 
> That's because the application assumes gnu89 behaviour of "inline" and
> "extern inline", but gcc5 defaults to gnu11. So we need to force gnu89
> in the compilation flags.
> 
> Fixes:
> http://autobuild.buildroot.org/results/fde/fde02ae2883a058b98e57ba087466d820ab1a5eb//
> http://autobuild.buildroot.org/results/e04/e04849c31e2a2528282ce6cdcf69aa10076d721d//
> http://autobuild.buildroot.org/results/7b3/7b3295e711fc51907c311adb63f0b7d06a90a7b9//

 Oh, small nit: it's better to use the short URLs (which fit in 80 columns):

http://autobuild.buildroot.org/results/fde02ae2883a058b98e57ba087466d820ab1a5eb


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
