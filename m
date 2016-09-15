From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Sep 2016 23:21:06 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix potential entire
	root filesystem removal
In-Reply-To: <a4cc525b-c26a-fb0d-23c5-c72482377e95@mind.be> (Arnout
 Vandecappelle's message of "Thu, 15 Sep 2016 22:58:27 +0200")
References: <1473929908-25697-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87k2edeay4.fsf@dell.be.48ers.dk>
 <fc0a0de7-398a-8b83-cf76-c4c0b031e01a@mind.be>
 <87y42tc4fl.fsf@dell.be.48ers.dk>
 <a4cc525b-c26a-fb0d-23c5-c72482377e95@mind.be>
Message-ID: <87lgysdflp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  TBH, I don't think it's worthwhile to include any other patch in 2016.08.1, not
 > even the fbterm one. It's just more effort than it's worth.

Yeah, agreed.


 >> >  But nothing is really screaming that it should be included.
 >> 
 >> Ok. We should probably figure out if we need to revert the CMAKE_SYSROOT
 >> addition (e8c3755676) and include that if needed.

 >  Er, why would we need to revert it? Did I miss something?

I thought it had been discussed on the list, but apparently not. We got
a report on IRC (I unfortunately don't have logs) that builds of custom
packages using cmake were failing with 2016.08. It is apparently caused
by CMAKE_SYSROOT transforming -I$STAGING_DIR/usr/include into --sysroot
$STAGING_DIR -I /usr/include. In 2016.08 we now default
BR2_COMPILER_PARANOID_UNSAFE_PATH to y, so it complains about it.

I don't quite understand how come this doesn't trigger on the
autobuilders and I haven't had time to investigate, but I got a 2nd
report off list with the same problem, so it sounds real.

Samuel, any ideas?

-- 
Venlig hilsen,
Peter Korsgaard 
