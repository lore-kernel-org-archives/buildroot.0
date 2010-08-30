From: James J. Dines <jdines@jdines.net>
Date: Mon, 30 Aug 2010 17:10:00 -0400
Subject: [Buildroot] Make 3.82 does behave differently than make
 3.81	for sure, but ...
In-Reply-To: <87y6bnx1h8.fsf@macbook.be.48ers.dk>
References: <4C7B99D5.9010703@jdines.net>
	<87bp8kxlve.fsf@macbook.be.48ers.dk>	<4C7BC441.3010006@jdines.net>	<201008301701.22856.yann.morin.1998@anciens.enib.fr>	<4C7BD1D6.5070100@jdines.net>	<20100830163153.GA12776@merkur.ravnborg.org>	<8739tvyip6.fsf@macbook.be.48ers.dk>
	<4C7C12E3.30005@jdines.net> <87y6bnx1h8.fsf@macbook.be.48ers.dk>
Message-ID: <4C7C1E28.1060806@jdines.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/30/2010 04:57 PM, Peter Korsgaard wrote:
>>>>>> "James" == James J Dines <jdines@jdines.net> writes:
> 
> Hi,
> 
>  James> I am really interested to hear your results, because I just
>  James> bought this new 8 core machine and set it up this weekend.  So
>  James> far everything has worked great, but there is always this
>  James> nagging worry that I have something set up wrong and I will have
>  James> to post back to the list stating that I was an idiot and missed
>  James> something :-)
> 
>  James> In any case, untarring buildroot-2010.05, doing a make defconfig
>  James> followed by a make clean seems like a set of steps that should
>  James> go off without a hitch (it certainly does on my other machine)
>  James> but it fails with make 3.82 for me anyway :-(
> 
>  James> [jdines at hydra buildroot-2010.05 ] make clean
>  James> package/atk/atk.mk:43: *** recipe commences before first target.  Stop.
> 
> Yeah, that's the bug in atk.mk Yann fixed earlier today. Could you give
> git a try instead (either git clone or wait for tomorrows snapshot
> tarball).
> 

I went for a third option (applying Yann's patch) and it indeed allows
the 'make clean' to work.  I remain confused why we did not need this
patch to do a complete build with make 3.81 however.  I just tried it
again, and I do not get the error message on my other machine with 3.81
even without the patch.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMfB4eAAoJECSpOhdQESq6WcYH/j1xrDLXel5j4J71Rqsv6gFr
5zy99A62YqgRjh4VrEZM07SnjZxAAimpEp5eUQCGGGbbxM3q0qFfZmGc6xPo+0lA
+bUP9fMdwjQiSJYZ42fmbSSNz3fvoQ6RhP85J3H5KvZEBD91H5jGtrNV7RK7Z+oI
PHy4aZroBlUP+TyQNRPB9Zd8ylC/sWghUya3cWs67h1rROGJKtOLeSaOWTSeRuKI
B7Lj7l3MDPB4rt1rC++vE7Sn17hiX1MCDoBijxuyR8jCmCwGUuiG/C+yUL+5oY2v
10uoQq0/wZ7P1uNiutWsoviLv8/KStQuOYg86ONUsJEVgDubHgLNF9rMXlQTopg=
=b3Zf
-----END PGP SIGNATURE-----
