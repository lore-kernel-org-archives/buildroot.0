From: Nicola Di Lieto <nicola.dilieto@gmail.com>
Date: Sun, 28 Apr 2019 18:11:30 +0200
Subject: [Buildroot] New lightweight Letsencrypt client with minimal
 dependecies
Message-ID: <20190428161130.GA11274@einstein.dilieto.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all

I have written and recently released uacme, an open source, lightweight 
ACME client written in C with minimal dependencies.  ACME is the 
protocol used by https://letsencrypt.org to issue free SSL certificates.  
Version 2 of the protocol was standardized as RFC8555 in March 2019 
(https://tools.ietf.org/html/rfc8555 ).

I believe uacme is currently the only ACMEv2 compatible client written 
in C.  Other than libc, it depends only on libcurl and either GnuTLS or 
mbedTLS.  Particularly when built against mbedTLS, it is small enough 
that it can even run on embedded systems with limited memory.
The software is at:

https://github.com/ndilieto/uacme

and the manual at https://ndilieto.github.io/uacme

If there is any interest, I can make patches to include it in buildroot.

Regards,
Nicola
