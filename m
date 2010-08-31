From: James J. Dines <jdines@jdines.net>
Date: Tue, 31 Aug 2010 08:38:11 -0400
Subject: [Buildroot] Make 3.82 does behave differently than make 3.81
 for sure, but ...
In-Reply-To: <201008310015.04723.m-starostik@versanet.de>
References: <4C7B99D5.9010703@jdines.net>
	<87y6bnx1h8.fsf@macbook.be.48ers.dk>	<4C7C1E28.1060806@jdines.net>
	<201008310015.04723.m-starostik@versanet.de>
Message-ID: <4C7CF7B3.2030807@jdines.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/30/2010 06:15 PM, Malte Starostik wrote:
> Am Montag, 30. August 2010, 23:10:00 schrieb James J. Dines:
<snip>
>>From make 3.82's NEWS file:
> 
> * WARNING: Backward-incompatibility!
>   As a result of parser enhancements, three backward-compatibility issues
>   exist: first, a prerequisite containing an "=" cannot be escaped with a
>   backslash any longer.  [...].  Second, variable names can no
>   longer contain whitespace, unless you put the whitespace in a variable and
>   use the variable.  Third, in previous versions of make it was sometimes
>   not flagged as an error for explicit and pattern targets to appear in the
>   same rule.  Now this is always reported as an error.
> 
> 
> What you're referring to re the kernel Makefile is the third mentioned issue.  
> What happens with atk.mk is the second one instead:
> 
> The incorrent Makefile snippet:
> 
> ATK_CONF_OPT =  --enable-shared \
>                 --enable-static
>                 --disable-glibtest --enable-explicit-deps=no \
>                 --disable-debug
> 
> assigns the vaue "--enable-shared --enable-static" to a variable named 
> "ATK_CONF_OPT" and the value "no --disable-debug" to a variable named "--
> disable-glibtest --enable-explicit-deps".
> 
> I didn't know variable names with spaces (and even leading hyphens) were 
> allowed prior to 3.82, but that made make not barf on the above while of 
> course depriving $(ATK_CONF_OPT) of some of the options.
> 
> Cheers
> Malte
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Thanks Malte!

In truth I would have NEVER looked in the NEWS file, as this seems like
it belongs in a file called IMPORTANT or something similar.

Now that I have this info I am armed to really take a look at what is
different about the build now that these errors will be properly caught.
 I have begun doing so and will report back on (some of?) my findings
later today.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMfPeoAAoJECSpOhdQESq6itwH/01ZhkzvL+g+KMnQCwdNwkxI
DvcKLwg17YDeRip7+xSewEMriTbw0S+0c6ya4Ck+4Qkf7kgXSETBuLShkDD0TJ46
rdCj5iJFnkWDRXxfltvF5AMYf9Cjvg1V3M+QciSyaYyCzvP5ayjG2JmtwjboCJhX
TcgcMsUiB1uYp8MzV7erdg2LC/LhQXuJztG8GXvvepPA7En/TVhKyfZNXX4w6Y9/
f6Cti1Zoe3JumIeT1a9dD/1u0Vxq4+biKWatJzXHT5BlfUCee0meCHZYmmRfx494
85iYHkjuL3GWyszqenL2NemUCdpIZYvPl2qMw619lIouoM5bBBkdfN66iOv+L2Q=
=W+BU
-----END PGP SIGNATURE-----
