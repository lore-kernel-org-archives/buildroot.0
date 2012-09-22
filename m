From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 22 Sep 2012 21:46:45 +0200
Subject: [Buildroot] [PATCH] unionfs: add missing dependency on
	host-pkg-config
In-Reply-To: <20120921205224.55eeda57@skate> (Thomas Petazzoni's message of
 "Fri, 21 Sep 2012 20:52:24 +0200")
References: <1348224356-20104-1-git-send-email-arnout@mind.be>
 <87ehlv79fj.fsf@macbook.be.48ers.dk> <20120921205224.55eeda57@skate>
Message-ID: <876275c02i.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Peter Korsgaard,
 Thomas> On Fri, 21 Sep 2012 16:11:12 +0200, Peter Korsgaard wrote:

 >> Lots of stuff indeed pulls in host-pkgconfig, and as 'u' is pretty late
 >> in the alphabet the chance is quite high that it is already available:

 Thomas> Can we somehow fight this alphabet thing and make things even more
 Thomas> random? Something that would shuffle the make targets or something, but
 Thomas> I don't know if it is possible.

I don't know of any easy/clean way, but it could probably be done by
some $(wildcard) / $(shell unsort ..) stuff instead of include
package/*/*.mk, but it won't be pretty.

-- 
Bye, Peter Korsgaard
