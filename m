From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Feb 2019 18:55:34 +0100
Subject: [Buildroot] [PATCH v2,1/1] gnuchess: needs -fPIC
In-Reply-To: <391d5d2d-90ca-1224-ce6f-cab3b440cbc7@mind.be> (Arnout
 Vandecappelle's message of "Wed, 23 Jan 2019 15:21:18 +0100")
References: <20190112175505.14348-1-fontaine.fabrice@gmail.com>
 <20190113141329.4d526438@windsurf.home>
 <391d5d2d-90ca-1224-ce6f-cab3b440cbc7@mind.be>
Message-ID: <87h8djtp49.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> I'm sorry but this doesn't make sense to me. -fPIC is for Position
 >> Independent Code, which is needed when building shared libraries. Here
 >> we are building with -static on Cortex-M which doesn't even have
 >> support for shared libraries. So building with -fPIC doesn't make sense
 >> I believe. It seems to be more a workaround than a real fix.
 >> 
 >> Perhaps this should be discussed with upstream binutils, or at least a
 >> proper investigation be done about those relocation types ?

 >  Or we could argue that gnuchess on Cortex-M probably isn't that essential, and
 > just put an architecture dependency...

That is also OK with me.

-- 
Bye, Peter Korsgaard
