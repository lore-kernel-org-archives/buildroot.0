From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Apr 2014 16:14:03 +0200
Subject: [Buildroot] [PATCH 5/5] stress: Patch to fix documentation
 source
In-Reply-To: <1396979109-10691-5-git-send-email-paul@crapouillou.net>
References: <1396979109-10691-1-git-send-email-paul@crapouillou.net>
 <1396979109-10691-5-git-send-email-paul@crapouillou.net>
Message-ID: <20140412161403.4c1f541f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Paul Cercueil,

On Tue,  8 Apr 2014 19:45:09 +0200, Paul Cercueil wrote:
> From: Maarten ter Huurne <maarten@treewalker.org>
> 
> Some versions of "makeinfo" consider @itemx not immediately following
> @item an error. It is a violation of the texinfo syntax, but silently
> ignored on most systems, for some reason.
> 
> Signed-Off-By: Maarten ter Huurne <maarten@treewalker.org>
> ---
>  package/stress/stress-0002-Fix-doc-itemx.patch | 47 ++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/stress/stress-0002-Fix-doc-itemx.patch

I don't think this patch is still necessary. Since commit
dc7a9bb9f7e0ac096d79c47e9240c2eb7b08dce9 (October 2013), we pass
MAKEINFO=: to avoid generating the stress documentation. So we should
not hit such issues.

If you're really interested in having this fixed, please submit the
patch to the upstream maintainer, apw at debian.org.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
