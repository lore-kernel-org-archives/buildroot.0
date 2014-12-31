From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Dec 2014 18:03:14 +0100
Subject: [Buildroot] [PATCH v2 1/7] Adding ding-libs
In-Reply-To: <1418398967-2183-2-git-send-email-gregd72002@gmail.com>
References: <1418398967-2183-1-git-send-email-gregd72002@gmail.com>
 <1418398967-2183-2-git-send-email-gregd72002@gmail.com>
Message-ID: <20141231180314.79697bfd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gregory Dymarek,

On Fri, 12 Dec 2014 15:42:41 +0000, Gregory Dymarek wrote:
> Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
> ---
>  package/Config.in                |  1 +
>  package/ding-libs/Config.in      |  9 +++++++++
>  package/ding-libs/ding-libs.hash |  1 +
>  package/ding-libs/ding-libs.mk   | 17 +++++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/ding-libs/Config.in
>  create mode 100644 package/ding-libs/ding-libs.hash
>  create mode 100644 package/ding-libs/ding-libs.mk

Thanks, applied, after doing again a fairly significant amount of fixes:

    [Thomas:
     - Remove unneeded comment in Config.in
     - Remove select if libiconv, not needed
     - Add dependency on wchar, needed when we depend on gettext
     - Improve Config.in help text
     - Fix the format of the hash file to make it actually useful
     - Fix the comment header in the .mk file
     - Remove useless commented line in .mk file
     - Fixup license information: it's not under GPLv3, but under LGPLv3+
       (library) and GPLv3+ (test programs)
     - Add host-pkgconf to the dependencies, remove libiconv from the
       dependencies.
     - Add a comment to explain why autoreconf is needed.
     - Remove usage of $(MAKE1) that does look necessary.]

See
http://git.buildroot.net/buildroot/commit/?id=3af1d306bdc4144e243e453221a7ab5a49b14e56
for the final commit.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
