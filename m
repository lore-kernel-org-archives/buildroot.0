From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 11 Aug 2015 07:12:37 +0200
Subject: [Buildroot] [PATCH v2] postgresql: fix sparc compile issue
In-Reply-To: <20150810155605.02f18e0e@free-electrons.com>
References: <20150809181336.GA23188@waldemar-brodkorb.de>
 <20150810155605.02f18e0e@free-electrons.com>
Message-ID: <20150811051237.GE8475@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Dear Waldemar Brodkorb,
> 
> On Sun, 9 Aug 2015 20:13:36 +0200, Waldemar Brodkorb wrote:
> > Fixes autobuilder compile error:
> > http://autobuild.buildroot.net/results/f374d3535cf91f139ce80703cd2d0a2be5d3b2b1/
> > 
> > The predefines are wrong:
> > ./output/host/usr/bin/sparc-buildroot-linux-uclibc-gcc -dM -E - </dev/null|grep sparc
> > #define sparc 1                                                                                                                                                                
> > #define __sparc__ 1                                                                                                                                                            
> > #define __sparc 1                                                                                                                                                              
> > #define __sparc_v8__ 1
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> > Changes v1 -> v2:
> >   - keep Solaris gcc specific defines as suggested by Thomas Petazzoni
> 
> Applied, thanks. Could you submit the patch upstream?

Done. And already applied:
http://git.postgresql.org/gitweb/?p=postgresql.git;a=commit;h=1f64ec6fd28bcd2be9b6b0ad3a5a630e117db601

best regards
 Waldemar
