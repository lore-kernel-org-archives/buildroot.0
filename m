From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Jan 2016 17:39:24 +0100
Subject: [Buildroot] [PATCH] mongodb: disable support for armv4 and armv5
In-Reply-To: <1451922623-12708-1-git-send-email-sergio.prado@e-labworks.com>
 (Sergio Prado's message of "Mon, 4 Jan 2016 13:50:23 -0200")
References: <1451922623-12708-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <87egdxjo3n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergio" == Sergio Prado <sergio.prado@e-labworks.com> writes:

 > When compiling for armv4 or armv5, we get the following error:
 > src/mongo/util/signal_handlers_synchronous.cpp:188:9: error: 'current_exception' is not a member of 'std'
 >      if (std::current_exception()) {
 >          ^

 > This is because libstdc++ will only enable std::current_exception if ATOMIC_INT_LOCK_FREE > 1, which is not the case for armv4 and armv5 architectures, so disable them.

 > Fixes:
 > http://autobuild.buildroot.net/results/589a02f511939531141135def73785b600113152/
 > http://autobuild.buildroot.net/results/89b9cd2dae8645b50407409c7f2a8567c551822c/
 > http://autobuild.buildroot.net/results/b8ffce927cb0563f5c43533ec2f02d3487acc198/

 > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
