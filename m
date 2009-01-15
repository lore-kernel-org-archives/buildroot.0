From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Jan 2009 09:56:02 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/acpid
In-Reply-To: <20090114235403.1FAC07697C@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Wed\, 14 Jan 2009 23\:54\:03 +0000 \(UTC\)")
References: <20090114235403.1FAC07697C@busybox.osuosl.org>
Message-ID: <87bpu99cd9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-14 23:54:02 +0000 (Wed, 14 Jan 2009)
 ulf> New Revision: 24851

 ulf> Log:
 ulf> Make acpid patch depend on VERSION

Why? We only have one acpi version in BR (and it should preferably
stay like that)

 ulf> -	toolchain/patch-kernel.sh $(ACPID_DIR) package/acpid/ acpid\*.patch
 ulf> +	toolchain/patch-kernel.sh $(ACPID_DIR) package/acpid/ acpid-$(ACPID_VERSION)\*.patch

So now acpid-sign-warning.patch + acpid-socket-path.patch won't get
applied? That sounds wrong.

-- 
Bye, Peter Korsgaard
