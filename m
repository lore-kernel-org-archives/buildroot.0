From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 21:57:26 +0200
Subject: [Buildroot] [PATCH v1 2/2] package/libv4l: build of v4l2
 utilities on noMMU platform
In-Reply-To: <1496830327-5235-3-git-send-email-hugues.fruchet@st.com>
References: <1496830327-5235-1-git-send-email-hugues.fruchet@st.com>
 <1496830327-5235-3-git-send-email-hugues.fruchet@st.com>
Message-ID: <20170608215726.7d44a6c6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 7 Jun 2017 12:12:07 +0200, Hugues Fruchet wrote:
> Remove dependencies on MMU, dynamic libraries and locale
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>

The removal of the dependencies on MMU and dynamic library should be
part of the previous patch, as I said in the other review.

However, the removal of the locale dependency, I'm not sure. Is it
fixed by your previous patch? Is it already fixed in v4l ?

Also, you want to review all packages that "select BR2_PACKAGE_LIBV4L",
and investigate whether we can remove the MMU/dynamic library
dependencies on those packages.

You're lucky, there are only two such packages:

package/v4l2grab/Config.in:     select BR2_PACKAGE_LIBV4L
package/zbar/Config.in: select BR2_PACKAGE_LIBV4L

Adjusting those packages (if applicable) can however be done in
separate patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
