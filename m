From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Aug 2016 11:34:17 +0200
Subject: [Buildroot] compiler plugins & compiling the kernel
In-Reply-To: <84805825-f7d4-cfef-d83a-071a5a761ced@mind.be> (Arnout
 Vandecappelle's message of "Wed, 24 Aug 2016 02:46:22 +0200")
References: <CAK7rcp_m+9YC6gJ0xyarD217F4wyjwjg9QSdBLzVgPJ9QLrm7w@mail.gmail.com>
 <20160820200119.4ec5848b@free-electrons.com>
 <CAK7rcp9SVrJ4HA3wH6U9P-Tv8EzJdBKUtZa=EVwihZTR5TCdtQ@mail.gmail.com>
 <CAK7rcp9ZEKb7dYNv23E7NF52+u0vL67f3q1XozKK3jRy2dq=pA@mail.gmail.com>
 <84805825-f7d4-cfef-d83a-071a5a761ced@mind.be>
Message-ID: <87lgzmh5nq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >>>>> linux-headers 3.14.51 Configuring...
 >> ...
 >> make[2]: Entering directory ... build/linux-headers-3.14.51
 >> Makefile:652 *** Your gcc installation does not support plugins. If
 >> the necessary headers for plugin support are missing, they should be
 >> installed. On Debian, apt-get install gcc-<ver>-plugin-dev. If you
 >> choose to ignore this error and...

 >  Ah, this is annoying...

 >  When installing linux-headers, we don't pass the cross-compilation arguments,
 > because the cross-compiler doesn't exist yet at that point. So the installation
 > will use the host compiler instead for that check. Which is of course wrong.

 >  Well, actually it's a bug in gr-security, because this check shouldn't be done
 > for install_headers (gcc isn't even called).

Yes, to me this is really a bug in gr-security, and not much we can do
about it.

 >>>> You're not correct. Support for plugins should be added to the
 >>>> cross-compiler if you need plugin support to build your kernel.
 >>>> 
 >>> 
 >>> That doesn't appear to be an option in buildroot.

 >  Well, we pass --enable-plugins when BR2_GCC_ENABLE_LTO is set. We don't pass
 > --disable-plugins so it really depends on the gcc defaults. But then, we don't
 > install the plugin development headers to HOST_DIR, so it will probably be
 > difficult to actually compile a plugin.

But patches are welcome!

-- 
Bye, Peter Korsgaard
