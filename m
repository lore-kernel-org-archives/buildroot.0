From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 16:21:01 +0100
Subject: [Buildroot] [PATCH] package/python-django: security bump to
 version 2.1.7
In-Reply-To: <20190215133202.27313-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 15 Feb 2019 14:32:01 +0100")
References: <20190215133202.27313-1-peter@korsgaard.com>
Message-ID: <87y369qiaq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2019-6975: Memory exhaustion in django.utils.numberformat.format()

 > If django.utils.numberformat.format() ? used by contrib.admin as well as the
 > the floatformat, filesizeformat, and intcomma templates filters ? received a
 > Decimal with a large number of digits or a large exponent, it could lead to
 > significant memory usage due to a call to '{:f}'.format().

 > To avoid this, decimals with more than 200 digits are now formatted using
 > scientific notation.

 > https://docs.djangoproject.com/en/2.1/releases/2.1.6/

 > 2.1.6 contained a packaging error, fixed by 2.1.7:

 > https://docs.djangoproject.com/en/2.1/releases/2.1.7/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.11.x, thanks.

For 2018.02.x I will instead use 1.11.20:

https://docs.djangoproject.com/en/2.1/releases/1.11.20/

-- 
Bye, Peter Korsgaard
