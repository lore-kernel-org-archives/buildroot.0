From: Ashwin Bihari <abihari@gmail.com>
Date: Wed, 1 Nov 2006 10:01:34 -0600
Subject: [Buildroot] Persistent tarball repository
In-Reply-To: <loom.20061101T164136-413@post.gmane.org>
References: <loom.20061101T151612-639@post.gmane.org>
	<1162394701.2945.4.camel@iridium.gnat.ca>
	<loom.20061101T164136-413@post.gmane.org>
Message-ID: <1f11a5490611010801o629294ffw7cde4e3f98778d16@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/1/06, MikeW <mw_phil@yahoo.co.uk> wrote:
>
> Yes, but 'make clean' only removes object files, causing a straight
> rebuild from
> source, 'distclean' is supposed to remove any make-generated/config files
> as
> well - IIRC.
>
> Which is not quite the same as deleting all your patiently downloaded
> tarballs as well !
>
> So I just wondered if there was a way to either allow distclean to spare
> the package source files, or alternatively, if you could 'get' from a
> local repository rather than having to download via FTP/HTTP, if your
> required file existed.
>
> Regards,
> MikeW
>

Predominently, "make distclean" is used to return a package to it's
"distributed" state and in so that means removing any generated files and,
in Buildroots case, any downloaded files.

You can hack your Makefile to not remove the "dl" directory if you so wish,
but I would think that the system is behaving as expected.

You could also do the get from a local repository by modifying the
appropriate <package>.mk file in the "package" directory.

Regards

-- 
~ Ashwin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20061101/199d7333/attachment.htm 
