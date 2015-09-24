From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Thu, 24 Sep 2015 07:40:47 -0300
Subject: [Buildroot] [git commit] openssl: change sed expression
	delimiter
In-Reply-To: <20150924115817.51306b11@free-electrons.com>
References: <20150923212758.B911C81739@busybox.osuosl.org>
 <20150924115817.51306b11@free-electrons.com>
Message-ID: <5603D32F.4090200@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/09/15 06:58, Thomas Petazzoni wrote:

> Actually, I am wondering of -Wl,-rpath,/lib:/usr/lib is the legal of
> doing things, and if it shouldn't be -Wl,-rpath,/lib
> -Wl,-rpath,/usr/lib. The first solution makes the assumption that ':'
> is the RPATH separator, while the latter does not make such assumption.

Hi, they're equivalent, if you build a dummy C program:

gcc -Wl,-rpath,/lib -Wl,-rpath,/usr/lib -o x1 x.c

And:

gcc -Wl,-rpath,/lib:/usr/lib -o x2 x.c

They result in the same RPATH entry in the binary (actually even the 
same sha256sum).

There are other gcc options that might go bad with : like using 
-std=iso9899:2011 instead of -std=c11.

With # only -### comes to mind which would hardly be useful in a real 
project.

Regards.
