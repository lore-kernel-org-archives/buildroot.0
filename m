From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Oct 2014 12:12:57 +0100
Subject: [Buildroot] [PATCH v2] schifra: fix build of examples and add
	hash
In-Reply-To: <87egto8pv7.fsf@dell.be.48ers.dk>
References: <1414491461-9629-1-git-send-email-arnout@mind.be>
 <20141028185534.7e3aafb2@free-electrons.com>
 <87egto8pv7.fsf@dell.be.48ers.dk>
Message-ID: <20141031121257.540f4ba3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Fri, 31 Oct 2014 12:01:32 +0100, Peter Korsgaard wrote:

> It seems like it changed AGAIN:
> 
> http://autobuild.buildroot.net/results/b62/b624c7f9fd7b431e97599e4b9b5e2a87fcb1a0a9/build-end.log
> 
> This is not workable. Nobody will be able to seriously use schifra in a
> project like this, and E.G. 2014.08 and earlier releases are broken.

Are we sure it changed again? Isn't the build error above caused by the
fact that the tarball in the cache was wrong, and now that we've added
the hash, the individual autobuilder instances are progressively
realizing that the tarball they have in their cache is wrong.

> What do we do?
> 
> - Get upstream to add a version number to the tarball and bump the
>   version whenever it changes
> 
> - Put a known good version on sources.buildroot.net and use that
> 
> - Drop the package

I personally don't care about schifra. It was added back in August 2012
by Simon Dawson, but unfortunately Simon is no longer contributing to
Buildroot.

Maybe we should first report the issue upstream?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
