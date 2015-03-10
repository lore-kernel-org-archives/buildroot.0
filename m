From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2015 22:35:46 +0100
Subject: [Buildroot] [PATCH 2/2] samba4: bump to version 4.2.0
In-Reply-To: <20150306102632.20dff6f7@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 6 Mar 2015 10:26:32 +0100")
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>
 <1425588249-20942-2-git-send-email-gustavo@zacarias.com.ar>
 <20150305232946.3620697e@free-electrons.com>
 <54F8F0AC.8030707@zacarias.com.ar>
 <20150306094008.7baf8c91@free-electrons.com>
 <54F96D83.4010304@zacarias.com.ar>
 <20150306102632.20dff6f7@free-electrons.com>
Message-ID: <87ioe8o7rh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Gustavo Zacarias,
 > On Fri, 06 Mar 2015 06:04:03 -0300, Gustavo Zacarias wrote:

 >> Well,  i've done it several times in the past, just search for "While at
 >> it" and "Also" in the commit logs - in fact it was you who committed
 >> them in many cases (and not only mine).
 >> Does this mean that i should separate bumps from adding hash files
 >> and/or renaming patches?

 > There is obviously a line to draw between things that we can do in the
 > same commit, and things that we should not. I believe adding a hash
 > file together with a bump is OK since anyway doing the bump would
 > change the hash file.

Exactly, the changes logically belong together and are easy/fast to
review.

A version bump + whitespace changes leading to a diffstat like this:

 package/samba4/samba4.mk                           | 100 +++++++------

Is certainly less so. If it was purely a white space change it would be
trivial to verify with git diff -w, E.G.:

git show -w 7152a50588

 >> Because the workload and noise committing will go up higher if that's
 >> the choice.

We already have 400+ commits/month, so 1 extra commit imho doesn't
hurt. It is true that it involves a bit more time on the contributor,
but is saves time for the maintainer (E.G. the version bumps, especially
yours are normally nobrainers to apply), and the limiting factor these
days seems to be maintainer/review cycles.

-- 
Bye, Peter Korsgaard
