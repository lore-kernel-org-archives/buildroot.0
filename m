From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Thu, 24 Mar 2016 16:36:08 +0100
Subject: [Buildroot] how to x-compile an in-house shared library ?
In-Reply-To: <56F4078A.6090002@yahoo.fr>
References: <56F4078A.6090002@yahoo.fr>
Message-ID: <56F40968.8060903@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Dear David,

the usual way for this is to add a custom package to buildroot (see
https://buildroot.org/downloads/manual/manual.html#adding-packages),
which uses your version control system to get the source of your
library and also your application(s) which uses this library should be
also built by Buildroot. The exact procedure to set this up depends on
the make/build system you use for the library and the applications.
Generally speaking it's better if you avoid hand-crafted Makefiles or
other build scripts and use a widely used make-generator tool to build
your components (autotools, cmake, qmake, etc), so you don't have to
manually tinker with the cross-compiling, as the makefile generator
(and Buildroot) will take care of that for you.

Regards

On 2016-03-24 16:28, David Picard wrote:
> Hello,
> 
> I developed a shared library some time ago. Now, I am developing a 
> program for an ARM target with Buildroot, and I need to link
> against this library.
> 
> I don't want to share the library with the community, because it's
> very specific. I have a very limited experience and knowledge of
> Buildroot. I'm eager to learn, but can't spend much time. I am
> building out of tree.
> 
> So, in my case, what is the easiest way to integrate (or not
> integrate ?) the library to Buildroot ?
> 
> Thanks, David. _______________________________________________ 
> buildroot mailing list buildroot at busybox.net 
> http://lists.busybox.net/mailman/listinfo/buildroot

- -- 
Zoltan Gyarmati
https://zgyarmati.de
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW9AlnAAoJEAGmEeeR8iVh1CQH/R8pgrL/Ruc6E5BpJspvb9ed
lE9Uauw9QHAKqu3TLJyClHoIyVzrhh3s9GiOqY2i2aHmur23qoZyuK9ZO33FmXXk
sbDMG+f1nFY0j8VkG2mU51bnTEpNhcqpt+vuwwfnWR8HxgmTCbb1jhSi79V7sWrj
aD57MKTauqOwF1AQ7u7//nCmZeyuZ5D2Er8iA+4nq35LCZZy8mYtrYuYRkFrF8RJ
O2pMu+nphWAHqj3TO0ql4z+Eb8IDRD+YJFApivoVQUwffubnd7HIGO+jG7oQXoTe
9CcRfC+H9FUCaeUF+Rp/X+y4nU2q7XbMkllr9oKwcINzKoTzbUy9ng2BBLBlyNU=
=GySX
-----END PGP SIGNATURE-----
