From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 05 Nov 2013 00:05:06 +0100
Subject: [Buildroot] [PATCH v3 2/2] ngrep: fix static linking issue with
	libpcre
In-Reply-To: <87li13q3g9.fsf@dell.be.48ers.dk>
References: <1383407472-2898-1-git-send-email-romain.naour@openwide.fr>
 <87li13q3g9.fsf@dell.be.48ers.dk>
Message-ID: <52782822.90900@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 04/11/2013 22:09, Peter Korsgaard a ?crit :
>>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:
> 
>  > Adding -lpcre in LDFLAGS place the library before object files:
>  > gcc ... -lpcre -L.../sysroot/usr/lib -s -o ngrep ngrep.o -lpcap
> 
>  > Makefile.in is patched to use @LIBS@ for adding -lpcre in the right place.
> 
>  > Fixes:
>  > http://autobuild.buildroot.net/results/684/684a3bed28d13ef5e5156257aade3b9aff32f180
> 
>  > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>  > ---
>  >  package/ngrep/ngrep-0003-fix-static-link.patch | 22 ++++++++++++++++++++++
>  >  package/ngrep/ngrep.mk                         |  2 +-
>  >  2 files changed, 23 insertions(+), 1 deletion(-)
>  >  create mode 100644 package/ngrep/ngrep-0003-fix-static-link.patch
> 
>  > diff --git a/package/ngrep/ngrep-0003-fix-static-link.patch b/package/ngrep/ngrep-0003-fix-static-link.patch
>  > new file mode 100644
>  > index 0000000..6d70778
>  > --- /dev/null
>  > +++ b/package/ngrep/ngrep-0003-fix-static-link.patch
>  > @@ -0,0 +1,22 @@
>  > +fix static link
>  > +Libraries must be placed before object files.
> 
> I guess you mean AFTER.
> 

Yes, copy and past error...
Thanks

Romain
