From: Adam Nielsen <a.nielsen@shikadi.net>
Date: Thu, 25 Apr 2013 14:46:05 +1000
Subject: [Buildroot] buildroot still compiles C++ code when C++ compiler is
	unavailable
Message-ID: <klacea$3sl$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

After a successful build and changing some settings, I'm struggling to get a 
second successful build.  I had to select a newer version of GCC to avoid some 
segfaults, but now when compiling I get these errors:

checking whether to build shared libraries... yes
checking whether to build static libraries... yes
checking how to run the C++ preprocessor... /lib/cpp
configure: error: in 
`buildroot/build/gettext-0.18.2.1/gettext-runtime/libasprintf':
configure: error: C++ preprocessor "/lib/cpp" fails sanity check
See `config.log' for more details
configure: error: ./configure failed for libasprintf
configure: error: ./configure failed for gettext-runtime

According to Google it's because I don't have a C++ compiler installed, which 
is correct, I had originally compiled it, but then I deselected it in the 
buildroot config as the library was too big to fit in my device's flash memory.

I was assuming buildroot would now omit those packages that require C++, but 
it looks like I am wrong.  Is there an easy way to find out which packages 
depend on C++ and tell buildroot not to build them, now I have deselected C++ 
support?

Thanks,
Adam.
