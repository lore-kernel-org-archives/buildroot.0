From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 May 2017 21:15:05 +0200
Subject: [Buildroot] [git commit] triggerhappy: bumped to 0.5.0 to fix
	systemd unit
In-Reply-To: <20170507140555.DF949827B4@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 7 May 2017 16:05:27 +0200")
References: <20170507140555.DF949827B4@busybox.osuosl.org>
Message-ID: <87bmr4qy12.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=3e23b1c9bb74bf1edf3f71d5c1e6e5e364e0821a
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This bumps the version of triggerhappy to 0.5.0

[...]

 > -TRIGGERHAPPY_VERSION = 7e5abc69f215678e93a6b999524981c8b40bdcd9
 > +TRIGGERHAPPY_VERSION = b822888066129350e51ad79f1cf307fa38dae4f7
 >  TRIGGERHAPPY_SITE = $(call github,wertarbyte,triggerhappy,$(TRIGGERHAPPY_VERSION))

I was going to say that it would have been nicer to use the 0.5.0
release tag, but apparently something goes wrong with the github helper
(probably the rewriting of '/' -> '_'):

make triggerhappy-patch
>>> triggerhappy release_0.5.0 Downloading
--2017-05-07 21:07:43--  https://github.com/wertarbyte/triggerhappy/archive/release_0.5.0/triggerhappy-release_0.5.0.tar.gz
Resolving github.com (github.com)... 192.30.253.113, 192.30.253.112
Connecting to github.com (github.com)|192.30.253.113|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://codeload.github.com/wertarbyte/triggerhappy/tar.gz/release_0.5.0/triggerhappy-release_0.5.0 [following]
--2017-05-07 21:07:44--  https://codeload.github.com/wertarbyte/triggerhappy/tar.gz/release_0.5.0/triggerhappy-release_0.5.0
Resolving codeload.github.com (codeload.github.com)... 192.30.253.121, 192.30.253.120
Connecting to codeload.github.com (codeload.github.com)|192.30.253.121|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2017-05-07 21:07:44 ERROR 404: Not Found.

-- 
Bye, Peter Korsgaard
