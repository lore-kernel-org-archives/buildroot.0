From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Aug 2015 15:56:05 +0200
Subject: [Buildroot] [PATCH v2] postgresql: fix sparc compile issue
In-Reply-To: <20150809181336.GA23188@waldemar-brodkorb.de>
References: <20150809181336.GA23188@waldemar-brodkorb.de>
Message-ID: <20150810155605.02f18e0e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Sun, 9 Aug 2015 20:13:36 +0200, Waldemar Brodkorb wrote:
> Fixes autobuilder compile error:
> http://autobuild.buildroot.net/results/f374d3535cf91f139ce80703cd2d0a2be5d3b2b1/
> 
> The predefines are wrong:
> ./output/host/usr/bin/sparc-buildroot-linux-uclibc-gcc -dM -E - </dev/null|grep sparc
> #define sparc 1                                                                                                                                                                
> #define __sparc__ 1                                                                                                                                                            
> #define __sparc 1                                                                                                                                                              
> #define __sparc_v8__ 1
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> Changes v1 -> v2:
>   - keep Solaris gcc specific defines as suggested by Thomas Petazzoni

Applied, thanks. Could you submit the patch upstream?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
