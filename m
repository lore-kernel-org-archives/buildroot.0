From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Oct 2015 09:43:20 +0100
Subject: [Buildroot] [PATCH 1/1] openssl: remove patch's git-hash to
	support fat/ntfs systems
In-Reply-To: <5633A1FE.3030906@mind.be> (Arnout Vandecappelle's message of
 "Fri, 30 Oct 2015 17:59:42 +0100")
References: <1446218867-6128-1-git-send-email-james.knight@rockwellcollins.com>
 <56339E03.4050303@mind.be>
 <CALe+oY-tjfi_UmiL6kS6FmSbX2TiQhFW=E6yKjs+aXYyFuO21Q@mail.gmail.com>
 <5633A1FE.3030906@mind.be>
Message-ID: <87ziyz1l93.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> I'll try to find a way to work around the setup I have then, maybe try
 >> a sanitation method (like you've suggested).

 >  The sanitation is an infrastructural change, of course. I would start with
 > replacing all the uses of <pkg>_SOURCE with a newly introduced <pkg>_DL_SOURCE
 > (which also includes the DL_DIR). Then in a second step you can sanitize
 > _DL_SOURCE and update the download infra.

Please keep in mind that we'll need a way to disable this and/or change
the primary/backup mirror handling so they continue to work
(sources.buildroot.net for one).

-- 
Bye, Peter Korsgaard
