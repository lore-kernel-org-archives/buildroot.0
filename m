From: Sonic Zhang <sonic.adi@gmail.com>
Date: Fri, 12 Apr 2013 11:39:41 +0800
Subject: [Buildroot] [PATCH v2 4/7] arch: toolchain: Introduce binary
 format FLAT types.
In-Reply-To: <20130407225132.38a9471c@skate>
References: <1364550643-11793-1-git-send-email-sonic.adi@gmail.com>
 <1364550643-11793-4-git-send-email-sonic.adi@gmail.com>
 <20130407225132.38a9471c@skate>
Message-ID: <CAJxxZ0P=w5Bv44jO6TMPnRC6e-tU6oWpV1zpsNnMAjBkofQpdw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Just figure out the compiling flags for BINFMT_FLAT_SHARED and
BINFMT_FLAT_SEP can't be put into the toolchain wrapper, because these
flags are for application only, they can't be used to build Linux
kernel.

-mid-shared-library -mshared-library-id=0
-msep-data

So, I have to move them back to file package/Makefile.in .

Regards,

Sonic
