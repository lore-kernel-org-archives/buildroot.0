From: James J. Dines <jdines@jdines.net>
Date: Mon, 30 Aug 2010 19:28:14 -0400
Subject: [Buildroot] Make 3.82 does behave differently than make
 3.81	for sure, but ...
In-Reply-To: <87pqwzwzp6.fsf@macbook.be.48ers.dk>
References: <4C7B99D5.9010703@jdines.net>
	<87bp8kxlve.fsf@macbook.be.48ers.dk>	<4C7BC441.3010006@jdines.net>	<201008301701.22856.yann.morin.1998@anciens.enib.fr>	<4C7BD1D6.5070100@jdines.net>	<20100830163153.GA12776@merkur.ravnborg.org>	<8739tvyip6.fsf@macbook.be.48ers.dk>
	<4C7C12E3.30005@jdines.net>	<87y6bnx1h8.fsf@macbook.be.48ers.dk>
	<4C7C1E28.1060806@jdines.net> <87pqwzwzp6.fsf@macbook.be.48ers.dk>
Message-ID: <4C7C3E8E.70309@jdines.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/30/2010 05:36 PM, Peter Korsgaard wrote:
>>>>>> "James" == James J Dines <jdines@jdines.net> writes:
> 
> Hi,
> 
>  James> I went for a third option (applying Yann's patch) and it indeed
>  James> allows the 'make clean' to work.  I remain confused why we did
>  James> not need this patch to do a complete build with make 3.81
>  James> however.  I just tried it again, and I do not get the error
>  James> message on my other machine with 3.81 even without the patch.
> 
> No, it seems like make 3.81 ignores those invalid lines.
> 
> besides this issue, is everything working for you with ake 3.82?
> 
I think things are working OK.  I am currently getting this error while
building oprofile 0.9.4 during the configure stage:

checking for bfd_openr in -lbfd... no
configure: error: bfd library not found
make: ***
[/home/jdines/Build/buildroot/output/build/oprofile-0.9.4/.stamp_configured]
Error 1

... but it seems like this is might be the issue:

http://old.nabble.com/configure-error:-bfd-library-not-found-td23863431.html

Excerpt:

So, do you have libbfd(.a or .so) installed in the usual place where
config would look for it?  If you do, then perhaps the problem is you
have a newer binutils where libbfd has a dependency on libz that
oprofile 0.9.4 did not handle, which resulted in this rather unhelpful
error message.  Pull the latest oprofile cvs code for a fix.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMfD6AAAoJECSpOhdQESq6ESEH/j8zRLV8g3oejph8MFgci0Wi
82wE9f9MDw0mtoyiWWYD5z2n8VhkqgsnhCqbOjKHMwjGi9G7AuyTzuwqZxC50A6E
kuVajig90Hxz0Ae0kH97ntte7mtwS19I/yXw8cFVorvUV6n6iOlmtni+vi/4T6tt
72xRLm3MmG46EGrn0W8297e3a6O4eUAM3f+GXV/pG2RVb5YnE9WnYC4axAZpMiT3
dyARY+w6XkXdy2+JX6IbzlXxj9v7mAtSd/9puvkhxkGrVLd60lnw2CQ/U0h8kMZq
NuPJYF/umHTO7hnS5Vf9Sp2hHTCjjL+rzRCDBE0M7AbMwdfVnIAe1nweC4ji4K8=
=QQ8F
-----END PGP SIGNATURE-----
