From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 21:13:49 +0200
Subject: [Buildroot] [PATCH 1/1] xorriso: Add host variant
In-Reply-To: <1458136515-6087-1-git-send-email-benoit.allard@greenbone.net>
References: <1458136515-6087-1-git-send-email-benoit.allard@greenbone.net>
Message-ID: <20160330211349.773d56f6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Mar 2016 14:55:15 +0100, Beno?t Allard wrote:
> Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>

Thanks, I've applied. But a few questions/comments below.


> +	  xorriso copies file objects from POSIX compliant
> +	  filesystems into Rock Ridge enhanced ISO 9660 filesystems
> +	  and allows session-wise manipulation of such filesystems.
> +	  It can load the management information of existing ISO
> +	  images and it writes the session results to optical media
> +	  or to filesystem objects.
> +
> +	  Vice versa xorriso is able to copy file objects out of ISO
> +	  9660 filesystems.
> +
> +	  https://www.gnu.org/software/xorriso

The Config.in help text for the target variant, in
package/xorriso/Config.in, is completely different. Yours is
copy/pasted from the xorriso home page, which looks good. So maybe it
would be good to use the same for the target variant of xorriso.

Another question is: can we use xorisso instead of cdrkit in
fs/iso9660/ to build ISO images ?

I don't have anything against cdrkit, but it uses CMake, and it takes
ages to build.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
