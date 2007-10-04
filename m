From: rafael2k <rafael@riseup.net>
Date: Wed, 3 Oct 2007 23:42:18 -0300
Subject: [Buildroot] x11r7 build error
In-Reply-To: <47021CF3.20409@promwad.com>
References: <200710011537.03174.rafael@riseup.net>
	<200710011740.03055.rafael@riseup.net> <47021CF3.20409@promwad.com>
Message-ID: <200710032342.22267.rafael@riseup.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Em Ter 02 Out 2007, Kuten Ivan escreveu:
> rafael2k wrote:
> > Hi all,
> >
> > Em Seg 01 Out 2007, Ivan Kuten escreveu:
> >> rafael2k ?????:
> >>> I'm triyng to compile x11r7 in a i386 host to a i386 target.
> >>>
> >>> the following error appears to me:
> >>> /home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/usr/bin
> >>>/.
> >>> ./lib/gcc/i386-linux-uclibc/4.2.1/../../../../i386-linux-uclibc/bin/ld:
> >>> cannot find /lib/libc.so.0
> >>> collect2: ld returned 1 exit status
> >>> libtool: install: error: relink `libxcb-xvmc.la' with the above command
> >>> before installing it
> >>
> >> This is what I get for arm arch: when relinking it looks in wrong
> >> location /usr/lib for libc library, however I do not get error because
> >> linker recognizes incompatible format and skips library:
> >
> > is this re-linking step really necessary?
> > i really don't have experience w/ the xorg compilation.
> > anyone has any advice to me?
>
> You have to repair by hands. Go to libxcb dir and remove wrong
> -L/usr/lib -L/lib occurrences in Makefiles.

hi Ivan,
libtool that is adding those -L...
is there any way to not use libtool?

thx!
rafael diniz


-- 
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
Ci?ncia da Computa??o @  Unicamp
R?dio Muda, radiolivre.org, TV Piolho, tvlivre.org, www.midiaindependente.org
Chave PGP: http://pgp.mit.edu:11371/pks/lookup?op=get&search=0x2FF86098
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part.
Url : http://busybox.net/lists/buildroot/attachments/20071003/173bc32f/attachment.pgp 
