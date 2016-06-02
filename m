From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 2 Jun 2016 19:12:49 +0200
Subject: [Buildroot] [BUG 2016.05] uClibc-ng argp-standalone War
In-Reply-To: <1902632.QltqilAAjO@laclwks004>
References: <1902632.QltqilAAjO@laclwks004>
Message-ID: <20160602171248.GN6825@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Brian Foster wrote,

> 
>  In 2016.05 there is a war between uClibc-ng and argp-standalone
>  (quoting from our bugs database):
> 
>    ? If uClibc-ng v1.0.14 does not have argp support enabled,
>     then it removes any installed <argp.h> header file.  Hence,
>     if the BuildRoot 2016.05 package argp-standalone is enabled,
>     a subsequent re-build of uClibc will remove argp-standalone's
>     installed <argp.h> header, which can (later) cause very puzzling
>     build failures. ?
> 
>   An example of a package which (forces, I think) the use of
>   argp-standalone is the rng-tools (but is not the only one!).
>   At the present time, I do not know if uClibc-ng's argp can
>   be used, or what the issue is(? was?) the uClibc(-ng?) argp.

Maybe it would be good to just use uClibc-ng argp and block
argp-standalone in case uClibc-ng is used. I have reports
from other projects, which successfully replaced argp-standalone
with the uClibc-ng included argp implementation.

@Brian: Could you cook up a patch and do some testing?

best regards
 Waldemar
