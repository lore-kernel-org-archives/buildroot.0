From: Jason Valenzuela <jvalenzuela@dspfl.com>
Date: Wed, 21 May 2008 11:56:55 -0400
Subject: [Buildroot] malloc/rpl_malloc
In-Reply-To: <326f33790805201145r785b06hcbec87b888ff8a76@mail.gmail.com>
References: <4831FE20.6050508@dspfl.com>	
	<326f33790805191734n68a95ee2m758c4266aeb4d02e@mail.gmail.com>	
	<48330E51.6050505@dspfl.com>	
	<326f33790805201131w57057429ydef6aa0df0bf0ec0@mail.gmail.com>	
	<48331ABD.1060907@dspfl.com>
	<326f33790805201145r785b06hcbec87b888ff8a76@mail.gmail.com>
Message-ID: <48344647.4020503@dspfl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to compile some packages of my own and am coming up with some 
problems at link time with the malloc function. According to the uclibc 
FAQ, MALLOC_GLIBC_COMPAT should be enabled in order for the configure 
script not to define malloc() to rpl_malloc(). I went to the 
toolchain_build_ARCH/uClibc-0.9.29 and did a 'make menuconfig'. This 
option under 'General Library Settings->Malloc returns live pointer for 
malloc(0)' was indeed enabled, causing me to believe that the uclibc in 
my buildroot toolchain is already correctly set.

Now going back to the build_ARCH/MY_PACKAGE directory and checking the 
config.h, HAVE_MALLOC has been defined as 0 and the results in 
config.log shows that the configure script didn't think malloc() was 
compatible with the GNU libc version.



Jason Valenzuela
