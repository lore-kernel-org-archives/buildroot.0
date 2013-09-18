From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Sep 2013 09:28:31 +0200
Subject: [Buildroot] [PATCH v4] python-pyzmq: new package
In-Reply-To: <1379169840-16377-2-git-send-email-rommel@layer-7.net> (Michael
 Rommel's message of "Sat, 14 Sep 2013 16:44:00 +0200")
References: <1379169840-16377-1-git-send-email-rommel@layer-7.net>
 <1379169840-16377-2-git-send-email-rommel@layer-7.net>
Message-ID: <87fvt2d1wg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Rommel <rommel@layer-7.net> writes:

 Michael> The python language bindings for ZeroMQ.

Committed with minor changes (see below) - Thanks.

 Michael> +config BR2_PACKAGE_PYTHON_PYZMQ
 Michael> +	bool "python-pyzmq"
 Michael> +	depends on BR2_LARGEFILE # zeromq
 Michael> +	depends on BR2_INET_IPV6 # zeromq
 Michael> +	depends on BR2_USE_WCHAR # zeromq
 Michael> +	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 Michael> +	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 Michael> +	depends on BR2_PACKAGE_PYTHON
 Michael> +	select BR2_PACKAGE_ZEROMQ
 Michael> +	help
 Michael> +	  This package contains the python language binding for zeromq.
 Michael> +	  Due to issues with cross-compiling this package is hardcoded
 Michael> +	  to the ZeroMQ version of this buildroot.

This comment rather belongs in the .mk file where we do this, so I moved
it just above the PATCH step.
 Michael> +
 Michael> +	  http://zeromq.org/bindings:python
 Michael> +
 Michael> +comment "python-pyzmq requires a toolchain with LARGEFILE support"
 Michael> +	depends on !BR2_LARGEFILE
 Michael> +
 Michael> +comment "python-pyzmq requires a toolchain with IPv6 and WCHAR support"
 Michael> +	depends on !(BR2_INET_IPV6 && BR2_USE_WCHAR)
 Michael> +
 Michael> +comment "python-pyzmq requires a toolchain with C++ support"
 Michael> +	depends on !BR2_INSTALL_LIBSTDCPP
 Michael> +
 Michael> +comment "python-pyzmq requires a toolchain with thread support"
 Michael> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

We normally have a single line comment (E.G. like zeromq does it), so I
changed that.

-- 
Bye, Peter Korsgaard
