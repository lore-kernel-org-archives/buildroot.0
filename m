From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Nov 2017 19:03:47 +0100
Subject: [Buildroot] Bug in RPATH fixing logic
In-Reply-To: <20171112182403.5d5c8fe4@windsurf.home> (Thomas Petazzoni's
 message of "Sun, 12 Nov 2017 18:24:03 +0100")
References: <20171112174013.25d90333@windsurf.home>
 <20171112174955.18449728@windsurf.home>
 <87y3nbs9jz.fsf@dell.be.48ers.dk>
 <20171112182403.5d5c8fe4@windsurf.home>
Message-ID: <87tvxzs7b0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sun, 12 Nov 2017 18:15:12 +0100, Peter Korsgaard wrote:

 >> > So this happens because the ARC binutils version is fetched from Git,
 >> > so we need to have host-flex installed, and binutils detects the flex
 >> > library and decides to use it.  
 >> 
 >> And there is no configure flag to disable that?

 > Not that I can see.

Ok.

 >> Is there a way to get binutils to use soft links instead of hard links?

 > How would this solve the problem?

Well, the problem is that the binary gets processed twice in different
directories because of the hard link, so if it instead was a softlink it
woud get ignored by the RPATH logic and only get fixed up once - Right?

-- 
Bye, Peter Korsgaard
