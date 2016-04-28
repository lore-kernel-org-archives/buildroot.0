From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 23:48:47 +0200
Subject: [Buildroot] [PATCH v2] purge-locales: Handle empty locale
	directories better
In-Reply-To: <1457470977.25961.147.camel@rtred1test09.kymeta.local> (Trent
 Piepho's message of "Tue, 8 Mar 2016 21:02:15 +0000")
References: <1457056294.25961.111.camel@rtred1test09.kymeta.local>
 <56DC8701.4000008@mind.be>
 <1457470977.25961.147.camel@rtred1test09.kymeta.local>
Message-ID: <874malv1z4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trent" == Trent Piepho <tpiepho@kymetacorp.com> writes:

 > If a locale directory is empty, shell code like "for langdir in
 > $$dir/*;" will loop once with langdir set to "path/to/dir/*", rather
 > than not looping at all, which would obviously be the desired
 > behavior.

 > Then "grep -qx $${langdir##*/}" ungoes two shell expansions (how?)
 > that transform the expression from "${langdir##*/}" to "*" to "list of
 > all files in buildroot root dir".  Which is most certainly not what
 > this command was supposed to do.

 > If one of those files happens to be an 8GB flash image, grep consumes
 > all available memory and crashes trying to search it.

 > Signed-off-by: Trent Piepho <tpiepho@kymetacorp.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
