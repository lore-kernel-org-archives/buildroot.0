From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 12 Apr 2014 08:38:00 -0300
Subject: [Buildroot] [PATCH] php: fix wrong -L and -I paths added by
	iconv tests
In-Reply-To: <20140412131421.65746140@skate>
References: <1397299022-31655-1-git-send-email-jcmvbkbc@gmail.com>
 <20140412131421.65746140@skate>
Message-ID: <53492598.2080908@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/12/2014 08:14 AM, Thomas Petazzoni wrote:
> I remember trying this possible fix the other day before replying to
> you, and it didn't work: the iconv detection was failing. I'll
> reproduce and get back to you with more details.

The fatal combination is basically uclibc with locale support where
libiconv isn't built and php is built with iconv support but not xmlrpc
(which has it's own iconv option, yeah, that's php for you).
I haven't delved too much into a proper fix at the moment but that'll
probably won't work in all the iconv scenarios around.
A possibility might be doing AUTORECONF and just fixing PHP_SETUP_ICONV
in aclocal/acinclude.m4, in the past AUTORECONFing php was broken but
that might have changed in recent versions.
Regards.
