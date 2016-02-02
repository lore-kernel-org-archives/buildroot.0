From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Feb 2016 16:32:42 +0100
Subject: [Buildroot] [PATCH] socat: security bump to version 2.0.0-b9
In-Reply-To: <1454416856-5879-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 2 Feb 2016 09:40:56 -0300")
References: <1454416856-5879-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871t8v5dr9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > Socat security advisory 7 and MSVR-1499: "Bad DH p parameter in OpenSSL"
 > Socat security advisory 8: "Stack overflow in arguments parser"

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  .../0002-ptrdiff_t-is-defined-in-stddef.h.patch    | 26 ++++++++++++++++++++++
 >  package/socat/socat.hash                           |  4 +++-
 >  package/socat/socat.mk                             |  2 +-
 >  3 files changed, 30 insertions(+), 2 deletions(-)
 >  create mode 100644 package/socat/0002-ptrdiff_t-is-defined-in-stddef.h.patch

 > diff --git a/package/socat/0002-ptrdiff_t-is-defined-in-stddef.h.patch
 > b/package/socat/0002-ptrdiff_t-is-defined-in-stddef.h.patch
 > new file mode 100644
 > index 0000000..7b435a9
 > --- /dev/null
 > +++ b/package/socat/0002-ptrdiff_t-is-defined-in-stddef.h.patch
 > @@ -0,0 +1,26 @@
 > +From 99c55f2694fe8621ca2344eb002610dac7f9c969 Mon Sep 17 00:00:00 2001
 > +From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > +Date: Tue, 2 Feb 2016 09:34:24 -0300
 > +Subject: [PATCH] ptrdiff_t is defined in stddef.h

What is this about? A new issue introduced in 2.0.0-b9? Musl fix? Your
commit message didn't mention anything about it?

>  # From http://www.dest-unreach.org/socat/download.md5sum
 > -md5	ff56576703dfdeac221357a348c30760	socat-2.0.0-b8.tar.bz2
 > +md5	553b1593d0a192cb09cbdc687ef1baac	socat-2.0.0-b9.tar.bz2
 > +#

Missing text? Locally calculated?

-- 
Bye, Peter Korsgaard
