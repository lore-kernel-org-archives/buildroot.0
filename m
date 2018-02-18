From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Feb 2018 21:56:23 +0100
Subject: [Buildroot] [PATCH] libvorbis: add upstream security fixes
In-Reply-To: <20180216080955.21114-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 16 Feb 2018 09:09:55 +0100")
References: <20180216080955.21114-1-peter@korsgaard.com>
Message-ID: <871shikoeg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2017-14632: Libvorbis 1.3.5 allows Remote Code Execution upon freeing
 > uninitialized memory in the function vorbis_analysis_headerout() in info.c
 > when vi->channels<=0, a similar issue to Mozilla bug 550184.

 > CVE-2017-14633: In libvorbis 1.3.5, an out-of-bounds array read
 > vulnerability exists in the function mapping0_forward() in mapping0.c, which
 > may lead to DoS when operating on a crafted audio file with
 > vorbis_analysis().

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
