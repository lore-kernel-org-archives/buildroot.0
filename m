From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Apr 2021 11:23:42 +0200
Subject: [Buildroot] [PATCH] package/python-pygments: security bump to
 version 2.7.4
In-Reply-To: <20210404185907.27471-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 4 Apr 2021 20:59:07 +0200")
References: <20210404185907.27471-1-peter@korsgaard.com>
Message-ID: <87k0pflqap.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2021-20270: An infinite loop in SMLLexer in Pygments versions 1.5 to
 >   2.7.3 may lead to denial of service when performing syntax highlighting of
 >   a Standard ML (SML) source file, as demonstrated by input that only
 >   contains the "exception" keyword

 > - CVE-2021-27291: In pygments 1.1+, fixed in 2.7.4, the lexers used to parse
 >   programming languages rely heavily on regular expressions.  Some of the
 >   regular expressions have exponential or cubic worst-case complexity and
 >   are vulnerable to ReDoS.  By crafting malicious input, an attacker can
 >   cause a denial of service

 > Python 2.x support was dropped in pygments 2.6, so adjust (reverse)
 > dependencies:

 > Version 2.6
 > -----------
 > (released March 8, 2020)

 > - Running Pygments on Python 2.x is no longer supported.
 >   (The Python 2 lexer still exists.)

 > Adjust the license hash for a change of copyright years:
 > https://github.com/pygments/pygments/commit/a590ac5ea7c00a41e253834306bfa19e38349c0b

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
