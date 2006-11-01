From: MikeW <mw_phil@yahoo.co.uk>
Date: Wed, 1 Nov 2006 16:23:24 +0000 (UTC)
Subject: [Buildroot] Persistent tarball repository
References: <loom.20061101T151612-639@post.gmane.org>
	<1162394701.2945.4.camel@iridium.gnat.ca>
	<loom.20061101T164136-413@post.gmane.org>
	<1f11a5490611010801o629294ffw7cde4e3f98778d16@mail.gmail.com>
Message-ID: <loom.20061101T171522-277@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ashwin Bihari <abihari@...> writes:
 
> Predominently, "make distclean" is used to return a package to it's
"distributed" state and in so that means removing any generated files and, in
Buildroots case, any downloaded files.
> You can hack your Makefile to not remove the "dl" directory if you so wish,
but I would think that the system is behaving as expected.You could also do the
get from a local repository by modifying the appropriate <package>.mk file in
the "package" directory.
> Regards-- ~ Ashwin
>

Yes - I think my issue is that the downloads are held 'within' the buildroot
tree, hence the semantics of distclean as you describe them mean that they
must go.

If they were outside the buildroot tree, then I guess distclean ought not
to clear them out.

Wonder if that's the making of a patch - only 'distclean' delete
downloaded tarballs if they occur under the buildroot directory;
but currently there's no menuconfig option to say where downloads are kept ...
however at the moment I just want something that 'works out of the box'!

Thanks,
MikeW
