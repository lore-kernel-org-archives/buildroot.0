From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Aug 2017 11:26:19 +0200
Subject: [Buildroot] [PATCH] gcc: fix sparcv8 compile issue
In-Reply-To: <20170804214454.GA5085@waldemar-brodkorb.de>
References: <20170804214454.GA5085@waldemar-brodkorb.de>
Message-ID: <ca184258-04dd-3ecd-bc21-c00e9d74aecb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-08-17 23:44, Waldemar Brodkorb wrote:
> Fix compile issue with gcc 7.1.0:
> /tmp/ccxalnSf.s: Assembler messages:
> /tmp/ccxalnSf.s:12: Error: Architecture mismatch on "rd %tick,%o1".
> /tmp/ccxalnSf.s:12: (Requires v9|v9a|v9b|v9c|v9d|v9e|v9v|v9m|m8; requested architecture is v8.)
> /tmp/ccxalnSf.s:13: Error: Architecture mismatch on "srlx %o1,32,%o0".
> /tmp/ccxalnSf.s:13: (Requires v9|v9a|v9b|v9c|v9d|v9e|v9v|v9m|m8; requested architecture is v8.)
> /tmp/ccxalnSf.s:30: Error: Architecture mismatch on "rd %ccr,%g0".
> /tmp/ccxalnSf.s:30: (Requires v9|v9a|v9b|v9c|v9d|v9e|v9v|v9m|m8; requested architecture is v8.)
> /tmp/ccxalnSf.s:33: Error: Architecture mismatch on "rd %ccr,%g0".
> /tmp/ccxalnSf.s:33: (Requires v9|v9a|v9b|v9c|v9d|v9e|v9v|v9m|m8; requested architecture is v8.)
> /tmp/ccxalnSf.s:36: Error: Architecture mismatch on "rd %ccr,%g0".
> /tmp/ccxalnSf.s:36: (Requires v9|v9a|v9b|v9c|v9d|v9e|v9v|v9m|m8; requested architecture is v8.)
> /tmp/ccxalnSf.s:39: Error: Architecture mismatch on "rd %ccr,%g0".
> /tmp/ccxalnSf.s:39: (Requires v9|v9a|v9b|v9c|v9d|v9e|v9v|v9m|m8; requested architecture is v8.)
> Makefile:684: recipe for target 'os-unix-sysdep.lo' failed
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

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
