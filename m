From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Jul 2017 00:06:35 +0200
Subject: [Buildroot] [PATCH] package/cache-calibrator: fix legal-info
In-Reply-To: <20170703213001.5404-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Mon, 3 Jul 2017 23:30:01 +0200")
References: <20170703213001.5404-1-yann.morin.1998@free.fr>
Message-ID: <87lgo55g5w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > cache-calibrator is a single C file that is downloaded as-is, and we
 > patch it. We also use that file as the license file.

 > Thus, the file when it is downloaded has a specific hash, but when
 > saved by legal-info, it has a different hash.

 > However, we can't store two different hashes for the same _filename_
 > with different content.

 > So, we extract the license file as a pre-patch hook, and store it in a
 > separate file, for which we can now add a hash.

Committed after adding a reference to the autobuilder issue, thanks.

We have the same issue with devmem2, so I've pushed a similar patch for
that.

-- 
Bye, Peter Korsgaard
