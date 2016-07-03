From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jul 2016 19:52:19 +0200
Subject: [Buildroot] [PATCH 3/3] package/transmission: add optional
	support for libminiupnpc/libnatpmp
In-Reply-To: <624cdb0c-6839-8b5b-3928-bc730bbc2a9f@mind.be> (Arnout
 Vandecappelle's message of "Sun, 3 Jul 2016 01:36:08 +0200")
References: <1467497893-16126-1-git-send-email-bernd.kuhls@t-online.de>
 <1467497893-16126-3-git-send-email-bernd.kuhls@t-online.de>
 <624cdb0c-6839-8b5b-3928-bc730bbc2a9f@mind.be>
Message-ID: <87inwmpq24.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 03-07-16 00:18, Bernd Kuhls wrote:
 >> Transmission bundles copies of both libraries and uses them if they are
 >> not provided by the system. This patch allows transmission to use the
 >> system libraries of libminiupnpc/libnatpmp.

 >  Our policy up to now has always been to never use the bundled versions if we
 > package the system version.

 >  However, how is it possible that these packages depend on !STATIC while
 > transmission does not? !FLAT is implied in USE_MMU so that one is OK.

Yes, it is a bit odd. I guess the !STATIC dependency is simply an issue
with the build system (E.G. is hardcoded to copy .so files) rather than
something in the source code.

-- 
Bye, Peter Korsgaard
