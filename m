From: James J. Dines <jdines@jdines.net>
Date: Mon, 30 Aug 2010 10:46:25 -0400
Subject: [Buildroot] package/atk/atk.mk:43: *** recipe commences before
 first target. Stop.
In-Reply-To: <87bp8kxlve.fsf@macbook.be.48ers.dk>
References: <4C7B99D5.9010703@jdines.net>	<201008301505.03304.yann.morin.1998@anciens.enib.fr>
	<87bp8kxlve.fsf@macbook.be.48ers.dk>
Message-ID: <4C7BC441.3010006@jdines.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/30/2010 09:37 AM, Peter Korsgaard wrote:
>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:
> 
>  Yann> James, All,
>  Yann> On Monday 30 August 2010 13:45:25 James J. Dines wrote:
>  >> I am getting the error in the subject line.  I have tried this both from
>  Yann> [--SNIP--]
>  >> Does anyone know what might be causing this?
> 
>  Yann> Please see the attached patch.
> 
>  Yann> Peter, I'll send a proper patch shortly if you want.
> 
> Committed, thanks!
> 

That patch indeed gets things rolling.  For further edification it
appears that there are some semantic changes in the parser for make 3.82
as the same tree builds fine with make 3.81.  It seems like it is
similar to this problem that Sam Ravnborg uncovered and patched (kernel
commit in the kernel Makefile 31110ebbec8688c6e9597b641101afc94e1c762a
)
 (See http://permalink.gmane.org/gmane.linux.kernel/1026412 for details)

I'm not sure how you guys handle regressions, but it seems like we make
3.82 users may look forward to experiencing other related problems so it
would be best to understand it fully.  Can anyone offer a good/thorough
explanation of what is going on by any chance, or do I have to figure it
out the old fashioned way?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMe8Q2AAoJECSpOhdQESq6LkwH/3MM1pQSXcGrEhRujzOL6Oy0
m+PRc+113B8UCcj8Cdf3iMpCD+b47gyB4cDf/nhpmXJxh7V6id3kD4mt2mk9dwR4
UIW6VTVNJZhQiCUyI4C5r7zvbtiyb2v+eFYPxll+VqQuvhmLo5DJla/klYJuC/MX
yfhxmEzoiUxX2FaLagp6xT14WlY4KkXmGfKqZsv2oIv6fOZZwbYjuMTM5dA6OimA
xeyA7O71VjXr3X7iAuRttkuggPrktIJa/cl7Tk2AD4jWGXd5kekmunx6MNuj04VH
RWyHeP0aX7EEu0XVNXAVHSUECXTmdlZD9WVTpHZoEjwDvKq0flNVFNOZ4ufUZ4Y=
=X5Gx
-----END PGP SIGNATURE-----
