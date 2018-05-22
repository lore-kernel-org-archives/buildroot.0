From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 May 2018 23:20:40 +0200
Subject: [Buildroot] [PATCH] pkg-generic: error out with 'local' site
 method and no _SITE
In-Reply-To: <9ba18873-320c-0296-e2be-94f00d180ac4@mind.be> (Arnout
 Vandecappelle's message of "Tue, 22 May 2018 12:41:33 +0200")
References: <20180518104524.4630-1-arnout@mind.be>
 <20180519103814.5cf1abae@windsurf>
 <9ba18873-320c-0296-e2be-94f00d180ac4@mind.be>
Message-ID: <871se31j6f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 19-05-18 10:38, Thomas Petazzoni wrote:
 >> Hello,
 >> 
 >> On Fri, 18 May 2018 12:45:24 +0200, Arnout Vandecappelle
 >> (Essensium/Mind) wrote:
 >> 
 >>> +ifeq ($$($(2)_OVERRIDE_SRCDIR),)
 >>> +$$(error $(1) has local site method, but `$(2)_SITE_METHOD` is not defined)
 >>> +endif
 >> 
 >> Are you sure it shouldn't be "$(2)_SITE" is not defined ?

 >  That was actually intentional. The idea is to allow 'local' packages to set
 > either _SITE or _OVERRIDE_SRCDIR. The check comes after the assignment to
 > _OVERRIDE_SRCDIR. The reason for this is: currently, 'local' packages work
 > correctly if you set _OVERRIDE_SRCDIR instead of _SITE, and I don't see a reason
 > to make them fail.

 >  I probably should have explained this in the commit log. It was a bit short :-)

Indeed! Will you send an update?

-- 
Bye, Peter Korsgaard
