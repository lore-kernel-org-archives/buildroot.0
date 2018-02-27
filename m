From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 17:03:10 +0100
Subject: [Buildroot] [PATCH v2 1/2] dependencies.mk: check for valid
 host-tar before other host dependencies
In-Reply-To: <20180227085541.11318-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 27 Feb 2018 09:55:40 +0100")
References: <20180227085541.11318-1-peter@korsgaard.com>
Message-ID: <87a7vupght.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > host-{cmake,lzip,xz} needs host-tar to extract their source code tarball, so
 > we need to ensure that host-tar gets added to DEPENDENCIES_HOST_PREREQ
 > before these in case they are both needed, otherwise the tools will fail to
 > extract.

 > With the upcoming change to blacklist modern tar versions this situation is
 > likely to trigger more often.

 > The real solution to this issue is the <foo>_EXTRACT_DEPENDENCIES rework,
 > but that series is a bit too intrusive to add this close to 2018.02, so
 > therefore this hack.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > Changes since v1:
 >  - Issue not specific to lzip, so put tar in front of everything else

Committed, thanks.

-- 
Bye, Peter Korsgaard
