From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Mar 2016 14:31:20 +0100
Subject: [Buildroot] Bug during Kodi compile with host gcc <4.7,
	question regarding autobuilders
In-Reply-To: <56E5E786.1090906@mind.be> (Arnout Vandecappelle's message of
 "Sun, 13 Mar 2016 23:19:50 +0100")
References: <934hrcx7vo.ln2@ID-313208.user.individual.net>
 <56E5E786.1090906@mind.be>
Message-ID: <87vb4pchjr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 03/13/16 22:53, Bernd Kuhls wrote:
 >> Hi,
 >> 
 >> before sending a patch which fixes a problem with host gcc < 4.7 I would
 >> like to ask whether this patch is needed at all. Are there autobuilders
 >> where the host version of gcc is < 4.7?

 >  Well, RHEL6 has gcc 4.4, and ideally we'd like to support RHEL5 as
 > well (many companies are still based on it).

 >  But we have a simple solution now: kodi depends on
 > BR2_HOST_GCC_AT_LEAST_4_7. Cfr. nodejs for instance, which faces the
 > same problem.

Indeed. And gcc10 uses host-gcc 4.4:

Using built-in specs.
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Debian 4.4.5-8' --with-bugurl=file:///usr/share/doc/gcc-4.4/README.Bugs --enable-languages=c,c++,fortran,objc,obj-c++ --prefix=/usr --program-suffix=-4.4 --enable-shared --enable-multiarch --enable-linker-build-id --with-system-zlib --libexecdir=/usr/lib --without-included-gettext --enable-threads=posix --with-gxx-include-dir=/usr/include/c++/4.4 --libdir=/usr/lib --enable-nls --enable-clocale=gnu --enable-libstdcxx-debug --enable-objc-gc --with-arch-32=i586 --with-tune=generic --enable-checking=release --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu
Thread model: posix
gcc version 4.4.5 (Debian 4.4.5-8)

-- 
Bye, Peter Korsgaard
