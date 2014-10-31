From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 31 Oct 2014 14:36:52 +0100
Subject: [Buildroot] [PATCH v2] schifra: fix build of examples and add
	hash
In-Reply-To: <20141031121257.540f4ba3@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 31 Oct 2014 12:12:57 +0100")
References: <1414491461-9629-1-git-send-email-arnout@mind.be>
 <20141028185534.7e3aafb2@free-electrons.com>
 <87egto8pv7.fsf@dell.be.48ers.dk>
 <20141031121257.540f4ba3@free-electrons.com>
Message-ID: <87wq7g743v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Peter Korsgaard,
 > On Fri, 31 Oct 2014 12:01:32 +0100, Peter Korsgaard wrote:

 >> It seems like it changed AGAIN:
 >> 
 >> http://autobuild.buildroot.net/results/b62/b624c7f9fd7b431e97599e4b9b5e2a87fcb1a0a9/build-end.log
 >> 
 >> This is not workable. Nobody will be able to seriously use schifra in a
 >> project like this, and E.G. 2014.08 and earlier releases are broken.

 > Are we sure it changed again? Isn't the build error above caused by the
 > fact that the tarball in the cache was wrong, and now that we've added
 > the hash, the individual autobuilder instances are progressively
 > realizing that the tarball they have in their cache is wrong.

Yes, I just tried downloading it here:
wget -q http://www.schifra.com/downloads/schifra.tgz
md5sum schifra.tgz
3b0aa73ed1ae1e2491e1a860a4f49f1b  schifra.tgz

Which doesn't match the .hash file.

 >> - Get upstream to add a version number to the tarball and bump the
 >> version whenever it changes
 >> 
 >> - Put a known good version on sources.buildroot.net and use that
 >> 
 >> - Drop the package

 > I personally don't care about schifra. It was added back in August 2012
 > by Simon Dawson, but unfortunately Simon is no longer contributing to
 > Buildroot.

Indeed, I'm of the same opinion.

 > Maybe we should first report the issue upstream?

I'll send a mail, and if it doesn't get resolved soon (or if somebody
steps up to say they need it), then I'll simply drop the package.

-- 
Bye, Peter Korsgaard
