From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 16 Oct 2014 11:05:12 +0200
Subject: [Buildroot] [PATCH] getent: look for glibc's getent in more
	places
In-Reply-To: <1413375322-27938-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Wed, 15 Oct 2014 14:15:22 +0200")
References: <1413375322-27938-1-git-send-email-arnout@mind.be>
Message-ID: <87wq80fkqf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > External toolchains don't always install the executable in /usr/bin -
 > God knows why. So check in a few more places.

 > We can use make's $(wildcard ...) here, because the variable only gets
 > expanded when the install step is executed, and by that time the
 > STAGING_DIR has already been installed.

 > Probably fixes most getent autobuilder errors, at least if fixes
 > http://autobuild.buildroot.net/results/615b9d17f713b4a53192efb00188560a76b9efa3/

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 > Someone should check the Linaro, Arago, Xilinx, and crosstool-NG
 > toolchains... Or we just wait for the autobuilders :-)

Yeah, lets see what it gives.

Committed, thanks. If we end up with external glibc toolchains that
really don't have a getent binary we might consider extending the
wildcard logic to fall back to our uclibc emulation - But lets wait and
see.

-- 
Bye, Peter Korsgaard
