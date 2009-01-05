From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jan 2009 22:54:35 +0100
Subject: [Buildroot] External toolchain problem with svn revision 24694
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909FA4C84@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE1909FA4C34@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE1909FA4C84@mi8nycmail19.Mi8.com>
Message-ID: <20090105225435.0aa68b1a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi hartleys,

Le Mon, 5 Jan 2009 16:47:53 -0500,
"hartleys" <hartleys@visionengravers.com> a ?crit :

> My bash scripting is not quite up to par but I think the
> $(copy_toolchain_sysroot) macro is doing the following:
> 
> 1) calls '$(TARGET_CC) -v'
> 2) greps the output for the "Configured ...." information
> 3) greps that information for the "--with-sysroot ..." string
> 4) cuts the string following --with-sysroot and assigns it to
> SYSROOT_DIR
> 5) copies the entire $${SYSROOT_DIR} to ${STAGING_DIR}
> 6) chmod's all the directories to 755

Exactly.

> The problem I have is my external toolchain does not have a
> --with-sysroot configuration option.

Which probably means that your toolchain hasn't been compiled with
sysroot support.

> Any ideas?

Yes and no.

Yes: I can make sure that we test if sysroot is supported by the
toolchain and if not fail out instead of doing stupid things. I will
commit a patch that implements this soon.

No: I don't see a proper way of supporting external toolchains if they
don't support sysroot. Our previous attempts of using --rpath-link have
all failed, and --sysroot seems to be the best option we've seen until
now.

Thanks for the report!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
