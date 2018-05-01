From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 22:12:54 +0200
Subject: [Buildroot] [PATCH 1/2] package/exim: remove libnsl linking
 with Glibc.
In-Reply-To: <20180501200508.13974-1-romain.naour@gmail.com>
References: <20180501200508.13974-1-romain.naour@gmail.com>
Message-ID: <20180501221254.7f29363b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 May 2018 22:05:07 +0200, Romain Naour wrote:
> libnsl has been deprecated from Glibc and no other libc provide it.
> Also there is no libnsl package in Buildroot yet, so remove -lnsl for
> all toolchains.
> 
> libnsl is now a library that can be packaged later if needed. [1]
> 
> Note: Fedora 28 has switched to the new libnsl library that bring
> IPV6 support. [2]
> 
> [1] https://github.com/thkukuk/libnsl.git
> [2] https://fedoraproject.org/wiki/Changes/NISIPv6

This commit log doesn't really explain the motivation for the change.
What is the ultimate goal here ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
