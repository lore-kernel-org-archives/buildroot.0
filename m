From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 17 Mar 2015 22:34:03 +0100
Subject: [Buildroot] Blackfin Buildroot toolchain issue
In-Reply-To: <55086A77.6060907@zacarias.com.ar>
References: <20150315221722.3645eb35@free-electrons.com>
 <20150315221813.173a36e2@free-electrons.com>
 <5508382D.7080008@zacarias.com.ar>
 <20150317153028.66788805@free-electrons.com>
 <55084360.1070405@zacarias.com.ar>
 <20150317161320.50559502@free-electrons.com>
 <55086A77.6060907@zacarias.com.ar>
Message-ID: <20150317213403.GC21001@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Gustavo Zacarias wrote,

> On 03/17/2015 12:13 PM, Thomas Petazzoni wrote:
> 
> > Dear Gustavo Zacarias,
> > 
> > On Tue, 17 Mar 2015 12:08:16 -0300, Gustavo Zacarias wrote:
> > 
> >> There's this as well:
> >> https://bugs.busybox.net/show_bug.cgi?id=7921
> >> Which basically boils down to uclibc NPTL requiring TLS.
> >> I'll check for space savings to see if it makes sense for it to even be
> >> an option.
> > 
> > I think it might make sense to keep it a blind option so that we don't
> > do --enable-tls on architectures that don't have TLS support at all (if
> > that even exists).
> 
> If blackfin supports it, everyone does ;)

My opinion on this is, that there are systems supporting threads
with uClibc, which do not have TLS support. Linuxthreads.old does
not make use of TLS. When you build for coldfire or ARM noMMU, tls 
is not available and it should be disabled while configuring gcc.

I am wondering why Blackfin enables TLS without any NPTL support.

best regards
 Waldemar
