From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Apr 2016 15:12:28 +0200
Subject: [Buildroot] [PATCH] libsrtp: fix SHA1 functions conflicts with
 downstream packages
In-Reply-To: <1461165767-15776-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1461165767-15776-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160422151228.67440c62@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Apr 2016 16:22:47 +0100, Vicente Olivert Riera wrote:
> Our current version of libsrtp is preventing linphone to build causing
> an error like this one:
> 
> configure:12952: error: This libsrtp version exports symbols conflicting
> with other libraries. Please use the one from
> git://git.linphone.org/srtp.git
> 
> Backporting an upstream patch to rename the SHA1 functions to avoid
> conflicts with downstream packages:
> 
>   https://github.com/cisco/libsrtp/commit/c270245a94ae9a007202754eb8f7ce9e48f97007
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/773/7733ee4472834d26cf6bdd4ca557ac19f97290f8/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ...-functions-to-avoid-conflicts-with-downst.patch | 396 +++++++++++++++++++++
>  1 file changed, 396 insertions(+)
>  create mode 100644 package/libsrtp/0001-Rename-SHA1-functions-to-avoid-conflicts-with-downst.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
