From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 17 Dec 2010 10:41:18 +0100
Subject: [Buildroot] [PATCH 47/55] linux: support a space-separated list
	of patches
In-Reply-To: <201012161722.00016.vapier@gentoo.org> (Mike Frysinger's message
	of "Thu, 16 Dec 2010 17:21:59 -0500")
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<1baf7aad49e6e48e95506af55611e18d70e4209d.1291582352.git.thomas.petazzoni@free-electrons.com>
	<878vzph06d.fsf@macbook.be.48ers.dk>
	<201012161722.00016.vapier@gentoo.org>
Message-ID: <871v5ghh35.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> On Thursday, December 16, 2010 16:34:18 Peter Korsgaard wrote:
 >> case "$$p" in
 >> http://*|http://*)

 Mike> guessing you meant ftp://|http://

Ehh, sure.

 Mike> also, this patch reminds me of common problem in buildroot.  why do people use 
 Mike> `dirname` and `basename` ?  these really should be letting the shell do it 
 Mike> like ${f##*/} and ${f%/*}.  or use make's builtins.

You cannot use make function as it's part of a shell loop, but shell
builtins could be used, sure - Even though shell parameter expansion in
combination with make escape rules starts to resemble line noise ;)

-- 
Bye, Peter Korsgaard
