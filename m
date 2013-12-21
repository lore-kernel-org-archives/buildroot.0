From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Dec 2013 18:50:12 +0100
Subject: [Buildroot] [PATCH 1/4] fs/custom: generate complete,
 partition-based device images
In-Reply-To: <8738lmgnsu.fsf@dell.be.48ers.dk>
References: <cover.1387578655.git.yann.morin.1998@free.fr>
 <64a7e3a995100104cdebd681621a9abb510a1820.1387578655.git.yann.morin.1998@free.fr>
 <20131221094905.2641a84f@skate> <8738lmgnsu.fsf@dell.be.48ers.dk>
Message-ID: <20131221185012.11155842@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sat, 21 Dec 2013 17:40:33 +0100, Peter Korsgaard wrote:

>  > The --show-depends option of genimages would, instead of doing the
>  > normal genimages work, simply parse the .ini file, and return a
>  > space separated list of dependencies needed by the ROOTFS_CUSTOM
>  > stuff. Not only this would make the dependencies automatic for the
>  > user, but also it would allow you to remove the following piece of
>  > code from the custom.mk file:
> 
> Sounds good to me. They won't actumatically get selected in kconfig
> though, but that might not be such a big deal (do they still even need
> to be visible in kconfig?)

I believe we have existing occurrences of host packages being listed in
some <pkg>_DEPENDENCIES, but not necessarily selected at the Kconfig
level. While we have enforced this not to happen for target packages,
we've never enforced that for host packages.

The rationale is that host packages should normally be completely
transparent to the user, and therefore not visible in Kconfig. The host
package sub-menu is here only to make it easier for the user to enable
*some* of the host packages that are actually relevant for the user
(and not merely build dependencies of other packages).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
