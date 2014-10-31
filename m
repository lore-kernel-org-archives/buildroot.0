From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 31 Oct 2014 12:01:32 +0100
Subject: [Buildroot] [PATCH v2] schifra: fix build of examples and add
	hash
In-Reply-To: <20141028185534.7e3aafb2@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 28 Oct 2014 18:55:34 +0100")
References: <1414491461-9629-1-git-send-email-arnout@mind.be>
 <20141028185534.7e3aafb2@free-electrons.com>
Message-ID: <87egto8pv7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> The OPTIONS argument passed to make had a redundant -o option, leading
 >> to:
 >> 
 >> g++ -pipe -Os   -o -o schifra_reed_solomon_speed_evaluation schifra_reed_solomon_speed_evaluation.cpp -lstdc++ -lm
 >> arm-linux-musleabi-g++: error: schifra_reed_solomon_speed_evaluation: No such file or directory
 >> 
 >> Fixes:
 >> http://autobuild.buildroot.net/results/2143b4f6f22f50ccb4af36732cc7d9304daa3ff9/
 >> 
 >> This error didn't occur before because upstream has silently updated
 >> the tarball. To protect against this in the future, a hash is added as
 >> well.
 >> 
 >> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 >> ---
 >> package/schifra/schifra.hash | 3 +++
 >> package/schifra/schifra.mk   | 2 +-
 >> 2 files changed, 4 insertions(+), 1 deletion(-)
 >> create mode 100644 package/schifra/schifra.hash

 > Applied, thanks.

It seems like it changed AGAIN:

http://autobuild.buildroot.net/results/b62/b624c7f9fd7b431e97599e4b9b5e2a87fcb1a0a9/build-end.log

This is not workable. Nobody will be able to seriously use schifra in a
project like this, and E.G. 2014.08 and earlier releases are broken.

What do we do?

- Get upstream to add a version number to the tarball and bump the
  version whenever it changes

- Put a known good version on sources.buildroot.net and use that

- Drop the package

-- 
Bye, Peter Korsgaard
