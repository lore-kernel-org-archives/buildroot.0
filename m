From: James J. Dines <jdines@jdines.net>
Date: Tue, 31 Aug 2010 12:16:38 -0400
Subject: [Buildroot] [Bug 2479] New: host-module-init-tools 3.11 fails
 to build
In-Reply-To: <bug-2479-163@https.bugs.busybox.net/>
References: <bug-2479-163@https.bugs.busybox.net/>
Message-ID: <4C7D2AE6.10100@jdines.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/31/2010 09:52 AM, bugzilla at busybox.net wrote:
> https://bugs.busybox.net/show_bug.cgi?id=2479
> 
>            Summary: host-module-init-tools 3.11 fails to build
>            Product: buildroot
>            Version: unspecified
<snip>
> Makefile:15: *** recipe commences before first target.  Stop.
<snip>


These three lines in
output/build/host-module-init-tools-3.11/Makefile.am are causing the issue:

SGML
mandir
TESTSUITE

... vim highlights them in red, and changing them to '= foo' causes the
build to kick off and fail when it gets to the SGML building stage.

I haven't figured out exactly how to change them to make them do as
desired yet, but hopefully this saves someone a lot of work.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMfSrZAAoJECSpOhdQESq63VMIAJXOLnbIkKBK3LkQ0VLPhZUk
zMeQ3IApE7F06IejQLR05tryWzy20r9UGR6SHvXL3c3OLK073aAr2VTlnZa3kQ+c
HzBVnmLPm6svrDlIxun86kxl3ERgM9JvCGdzU6/ISYcVnru3pBfM7abcOZnKWbij
lvhCRycxPZdhph0cg7UvJ0IMqkse+asQfFtAcoI1spZO821DhCMI84C3hcPZLW7Y
2JpoIbHUfk0lPJ1sK0FO0WWkzPWCgJAe8VNH4vtFhZr6JzqMy5Sfbk+5JKI77nWt
tlRhuh/baWMIibGYx4PcG1/2jR8pYt/OC0YrLMMuWexgj6w85BEX8qFyBHhujzI=
=JUn+
-----END PGP SIGNATURE-----
