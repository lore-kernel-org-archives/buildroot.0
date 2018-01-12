From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 12:08:03 +0100
Subject: [Buildroot] [PATCH 1/1] unbound: new package
In-Reply-To: <7b6d5bbd-86f5-6c81-e26e-db8b29ae2831@petroprogram.com>
References: <20180111232039.24270-1-stefan.froberg@petroprogram.com>
 <jt1miexfp7.ln2@ID-313208.user.individual.net>
 <7b6d5bbd-86f5-6c81-e26e-db8b29ae2831@petroprogram.com>
Message-ID: <20180112120803.0ddb7b6d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Jan 2018 12:45:06 +0200, Stefan Fr?berg wrote:

> > Why not "select BR2_PACKAGE_OPENSSL"?
> > Did you test with libressl as well?
> >  
> 
> That cannot be select because it's a choise and if I remember buildroot
> manual and
> what Thomas said, you can't (or actually shouldn't) select from choice
> unless
> absolutely necessary (like, for example, in my turbovnc patch...have to
> remember update that too...)

It is correct that regular virtual packages cannot be selected.

But openssl (like jpeg) is special, and you can select
BR2_PACKAGE_OPENSSL. BR2_PACKAGE_OPENSSL is not part of a choice.

The case of turbovnc is different: you wanted to select jpeg-turbo
specifically, which is one jpeg implementation. And this is not
possible.

See the difference ? BR2_PACKAGE_OPENSSL is the virtual package itself,
which has two implementations: libopenssl and libressl, selectable
through a choice.

BR2_PACKAGE_JPEG_TURBO is one implementation of the BR2_PACKAGE_JPEG
virtual package. Selecting BR2_PACKAGE_JPEG is OK (just like selecting
BR2_PACKAGE_OPENSSL is OK), but selecting BR2_PACKAGE_JPEG_TURBO
doesn't work.

So Bernd is totally correct: you should select BR2_PACKAGE_OPENSSL. See
how many packages are already doing this today :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
