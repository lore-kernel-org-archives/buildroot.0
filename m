From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Feb 2021 14:17:09 +0100
Subject: [Buildroot] Fwd: Failed pipeline for 2021.02-rc1 | buildroot |
 92237c45
In-Reply-To: <a96729fe-e872-02a3-592e-8adc379d809a@mind.be> (Arnout
 Vandecappelle's message of "Thu, 11 Feb 2021 13:48:15 +0100")
References: <602456474c4eb_b2ab5a703162be@gitlab-sidekiq-catchall-v1-6d55b89d66-6zn9h.mail>
 <6594f32e-a013-2622-20a8-91cf6edf568a@essensium.com>
 <87blcqke1z.fsf@dell.be.48ers.dk>
 <a96729fe-e872-02a3-592e-8adc379d809a@mind.be>
Message-ID: <877dnekalm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> > Job #1019385566 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/1019385566/raw )
 >> 
 >> > Stage: test
 >> > Name: avenger96_defconfig
 >> 
 >> Hmm, that log isn't very helpful. Any idea what is going on? I just did
 >> a test build here without issues.

 >  Ah, I forgot that the text version of that mail appends /raw at the end of the
 > URLs. You have to go to the job page, then go to the artifacts, and there you
 > find the full log.

 > There you find:

 > scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory
 >  #include <openssl/bio.h>
 >                          ^

Ahh, ok.

 >> Is it perhaps a case of missing BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL?

 >  Looks like it :-)

Great, I'll send a patch.

-- 
Bye, Peter Korsgaard
