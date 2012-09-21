From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Sep 2012 16:20:02 +0200
Subject: [Buildroot] [PATCH] unionfs: add missing dependency on
	host-pkg-config
In-Reply-To: <505C597E.8020306@mind.be> (Arnout Vandecappelle's message of
 "Fri, 21 Sep 2012 14:11:42 +0200")
References: <1348224356-20104-1-git-send-email-arnout@mind.be>
 <505C4969.8090707@zacarias.com.ar> <505C4C17.2000701@mind.be>
 <505C4DB3.8000008@zacarias.com.ar> <505C4E1A.7000809@mind.be>
 <505C5180.10105@zacarias.com.ar> <505C597E.8020306@mind.be>
Message-ID: <877grn790t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On 09/21/12 13:37, Gustavo Zacarias wrote:
 >> host-pkg-config almost always present

 Arnout>  Maybe we should make that _always_ present, and add
 Arnout> host-pkg-config to the toolchain build...  It is more or less
 Arnout> part of the toolchain, and it doesn't hurt to build it if it's
 Arnout> not needed.

That's an option, but it's fairly slow to build (mainly because of the
embedded glib), so people might not like it (especially if using an
external toolchain). Perhaps it would be better to move to pkgconf
instead then (I think Gentoo uses it)?

https://github.com/pkgconf/pkgconf

-- 
Bye, Peter Korsgaard
