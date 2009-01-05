From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 Jan 2009 17:12:17 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target: device/Atmel
	u-boot
In-Reply-To: <20090103155041.42D3976BC9@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sat\, 3 Jan 2009 15\:50\:40 +0000 \(UTC\)")
References: <20090103155041.42D3976BC9@busybox.osuosl.org>
Message-ID: <873afxwx3y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> +$(U_BOOT_AUTOSCRIPT).$(PROJECT): $(U_BOOT_AUTOSCRIPT) $(MKIMAGE)
 ulf> +	$(MKIMAGE) -A arm \

ARM?
 ulf> +				-O linux \
 ulf> +				-T script \
 ulf> +				-C none \
 ulf> +				-a 0 \
 ulf> +				-e 0 \
 ulf> +				-n "autoscr config" \
 ulf> +				-d $(U_BOOT_AUTOSCRIPT) \
 ulf> +				$(U_BOOT_AUTOSCRIPT).$(PROJECT)
 ulf> +	cp $(U_BOOT_AUTOSCRIPT).$(PROJECT) $(TARGET_ATMEL_COPYTO)

TARGET_ATMEL_COPYTO?

Sorry, this breaks the build and I want to atleast get the u-boot
build to complete today, so I'm reverting this for now.

-- 
Bye, Peter Korsgaard
