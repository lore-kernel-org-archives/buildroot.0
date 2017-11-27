From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Nov 2017 11:07:52 +0100
Subject: [Buildroot] [PATCH v1] Fix makefile include order by using
 sort/wildcard.
In-Reply-To: <a3441ea0-b5da-d5ab-ff93-af09b1dd151d@mind.be> (Arnout
 Vandecappelle's message of "Fri, 24 Nov 2017 00:23:00 +0100")
References: <20171121191330.5621-1-ps.report@gmx.net>
 <a3441ea0-b5da-d5ab-ff93-af09b1dd151d@mind.be>
Message-ID: <878tesavbb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 21-11-17 20:13, Peter Seiderer wrote:
 >> Use ordered 'include $(sort $(wildcard ...))' instead of unordered
 >> direct 'include */*.mk'.
 >> 
 >> Fixes [1] reported by Petr Vorel:
 >> 
 >> make: *** No rule to make target 'toolchain-external-custom',
 >> needed by '.../build/toolchain-external/.stamp_configured'.  Stop.
 >> 
 >> [1] http://lists.busybox.net/pipermail/buildroot/2017-November/206969.html
 >> 
 >> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

 >  There was one more include that wasn't sorted:

 > -include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(dir)/docs/*/*.mk)

 > I've fixed that one as well, I've extended the commit log a little, and applied
 > to master, thanks.

Committed to 2017.02.x and 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
