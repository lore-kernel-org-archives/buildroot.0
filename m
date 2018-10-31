From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Oct 2018 11:51:23 +0100
Subject: [Buildroot] [git commit] lighttpd: adjust Config.in to make
 check-package happy
In-Reply-To: <20181031112643.01ebb772@windsurf> (Thomas Petazzoni's message of
 "Wed, 31 Oct 2018 11:26:43 +0100")
References: <20181031095117.912A283807@busybox.osuosl.org>
 <874ld2ct7u.fsf@dell.be.48ers.dk> <20181031112643.01ebb772@windsurf>
Message-ID: <87va5ibd90.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Wed, 31 Oct 2018 11:21:09 +0100, Peter Korsgaard wrote:

 >> Ups, wonder how that happened. I'll have a look at executing
 >> check-package in a git pre-commit hook.

 > If you do this, could you share whatever you have done? I'd like to
 > have this here as well, to avoid having such issues in the future.

I simply added a post-commit / post-applypatch script which runs 'make
checkpackage' for now.

A more optimal solution could be made which would only run it on
added/changed files, but I haven't tried that. Probably it can be done
with git show | lsdiff -s and then filter out removed (prefixed with -)
files.

-- 
Bye, Peter Korsgaard
