From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Apr 2016 23:16:57 +0200
Subject: [Buildroot] [PATCH 01/15] fs: add genimage infra
In-Reply-To: <20160413234530.502a4244@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 13 Apr 2016 23:45:30 +0200")
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460577820-32164-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <570EBAE6.1080000@mind.be>
 <20160413234530.502a4244@free-electrons.com>
Message-ID: <871t67j3g6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Wed, 13 Apr 2016 23:32:22 +0200, Arnout Vandecappelle wrote:

 >> Therefore, at least as a first step, I guess it's better to just move the 
 >> script to a common place, e.g. to package/genimage/post-image.sh. Let it take a 
 >> single argument for the genimage.cfg file, and add some documentation to the manual.

 > As an after-thought, this seems like a good idea. This is really a very
 > simple and minimal change, and is easy to do.

The only complication is that you cannot directly pass arguments to
post-image scripts, you have to use BR2_ROOTFS_POST_SCRIPT_ARGS (and it
gets used for all scripts).

-- 
Bye, Peter Korsgaard
