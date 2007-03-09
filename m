From: Zachary P. Landau <kapheine@gmail.com>
Date: Fri, 9 Mar 2007 10:37:50 -0500
Subject: [Buildroot] Odd behavior when displaying locale date and
	decimal information
In-Reply-To: <a04f56da0703011554n6572d5bdxffde5b8f90bc65cd@mail.gmail.com>
References: <a04f56da0703011554n6572d5bdxffde5b8f90bc65cd@mail.gmail.com>
Message-ID: <a04f56da0703090737t1ffaa1f9s6d7c5a458bad96ee@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a little more information on this problem.  I ran the
localeconv() call on the target and looked at some of the data
returned.  conv->decimal_point returns an empty string, rather than
"." as I would expect.  That would probably explain why the decimal
numbers are missing from printf.

setlocale() says the current locale is set to "C" which is what I
would expect.  But for some reason it seems the correct locale
information is missing from it.  I tried looking through uClibc's
locale code to see if there were any ifdefs that maybe I messed up
while configuring buildroot, but I couldn't find any that seemed to
help.  But there is a lot of code there, maybe someone else has a
better idea.

By the way, I am posting to the buildroot mailing list because I'm
guessing that it is a configuration issue and not an actual bug with
uClibc.  But if others disagree then I can post on the uClibc mailing
list instead.

-- 
Zachary P. Landau <kapheine@gmail.com>
