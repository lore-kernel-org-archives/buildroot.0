From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jun 2016 00:01:31 +0200
Subject: [Buildroot] [PATCH 1/2] python: enable bzip2 in host variant
In-Reply-To: <1461508789-17644-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1461508789-17644-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1461508789-17644-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20160616000131.7f09d903@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Apr 2016 16:39:48 +0200, Eric Le Bihan wrote:
> Enable support for bzip2 in Python host variant, so the tarfile module
> works properly.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Could you give some more details about this? The tarfile module seems
to only import the bz2 module when a bzip2-compressed file is handled.
Is this actually the case with rust?

I am hesitant between applying your patch (and therefore removing
package/nodejs/0.10.45/0001-remove-python-bz2-dependency.patch), or
adding an hidden BR2_HOST_PACKAGE_PYTHON_BZIP2 that the rust package
could select to make sure bzip2 support is built into host-python.

Indeed, host-python is used by numerous packages, and we're trying to
not add too many dependencies to host-python. On the other hand,
building bzip2 is pretty fast, so maybe it's reasonable to add it as a
mandatory dependency of host-python.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
