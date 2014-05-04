From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 May 2014 11:42:44 +0200
Subject: [Buildroot] [RFCv1 8/8] package/gcc: disable libsanitizer for
	uClibc and musl
In-Reply-To: <1398291272-17591-9-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 24 Apr 2014 00:14:32 +0200")
References: <1398291272-17591-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1398291272-17591-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874n15lw17.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > libsanitizer requires wordexp() support which we lack in our current
 > default uClibc configurations (and it's fat & big).
 > Hence disable it when the toolchain is uClibc-based.
 > It only affects gcc 4.9+ since it's default on now for supported
 > platforms.

 > Another build issue also affects libsanitizer on musl toolchains, even
 > with previous versions of gcc such as 4.8.x, so we disable it as well.

 > [Thomas: add the musl side of things.]

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I've committed Gustavo's version, so this needs to changed to just add
the delta.

-- 
Bye, Peter Korsgaard
