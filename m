From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 15:48:53 +0100
Subject: [Buildroot] [RFC PATCH 2/9] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <1488550733-3956-3-git-send-email-wg@grandegger.com>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
 <1488550733-3956-3-git-send-email-wg@grandegger.com>
Message-ID: <20170303154853.4eb15819@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Mar 2017 15:18:46 +0100, Wolfgang Grandegger wrote:
> From: Samuel Martin <s.martin49@gmail.com>
> 
> This commit introduces a fix-rpath script able to scan a tree,
> detect ELF files, check their RPATH and fix it in a proper way.
> The RPATH fixup is done by the patchelf utility using the option
> "--make-rpath-relative".
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---
>  support/scripts/fix-rpath | 106 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100755 support/scripts/fix-rpath

Now that patchelf is much smarter, I am wondering if we still really
need a utility script just to call patchelf. Have you tried bringing
this logic into the make logic?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
