From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2016 23:12:23 +0100
Subject: [Buildroot] user question about ubi nand
In-Reply-To: <56D19A42.2000809@mind.be> (Arnout Vandecappelle's message of
 "Sat, 27 Feb 2016 13:44:50 +0100")
References: <CAJJ6jxu+5mSnNq6hmnCS1nB5cx8qmyip5qoRONjtw1WHUqox5A@mail.gmail.com>
 <56CE3628.7000903@mind.be>
 <CAJJ6jxvynFore7-FZNbtXj_LXUDjH4-Kt--2=BpuytjEefuy0A@mail.gmail.com>
 <56D19A42.2000809@mind.be>
Message-ID: <87r3fxreew.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> Thanks, that config was hidden behind another one, and a little tricky
 >> to find, but once I knew what I wanted it worked great.

 >  Ah yes, it makes sense from the perspective of the buildroot logic (buildroot
 > primarily builds a filesystem, and for ubifs you can optionally embed that into
 > a UBI image, and only in that case there is a config file possible). But from a
 > user it is not completel logical.

 >  We should perhaps restructure the filesystem creation a little into a part
 > about the actual filesystem and a part about making images out of the
 > filesystems. Because we now already have a few different ways of making images
 > that are not just filesystems (isohybrid, ubi). And in the defconfigs we use
 > genimage instead...

FYI, I think it makes sense to add a genimage (post-)filesystem option,
now that we use it is in several defconfigs.

-- 
Bye, Peter Korsgaard
