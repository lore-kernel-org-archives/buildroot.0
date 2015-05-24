From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 May 2015 23:49:01 +0200
Subject: [Buildroot] [PATCH] package/ipmiutil: really disable lanplus
In-Reply-To: <1432403781-11670-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 23 May 2015 19:56:21 +0200")
References: <1432403781-11670-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87vbfhzlwy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Due to weird constructs in the Makefiles, lanplus is always built, even
 > when explicitly disabled with --disable-lanplus .

 > So, add a patch to enforce disabling lanplus. We're doing an at-minima
 > patch just for the upcoming Buildroot release, and to avoid diverging
 > too far from upstream...

You forgot to add autobuilder references, but as you:

> +    ./inc/ipmitool/ipmi.h:51:25: fatal error: openssl/evp.h: No such file or directory
 > +
 > +Sample build error visible at:
 > +    http://autobuild.buildroot.org/results/04a/04a1c48d484debd7894fd32997ed50d3a0110b93/build-end.log

You added one here, I've added that to the commit message and committed
- Thanks.

-- 
Bye, Peter Korsgaard
