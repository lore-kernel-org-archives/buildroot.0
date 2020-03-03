From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Mar 2020 22:54:40 +0100
Subject: [Buildroot] [PATCH 1/2] package/zziplib: fix CVE-2018-16548
In-Reply-To: <20200303201622.283957-1-fontaine.fabrice@gmail.com>
References: <20200303201622.283957-1-fontaine.fabrice@gmail.com>
Message-ID: <20200303225440.05c016f3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  3 Mar 2020 21:16:21 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> An issue was discovered in ZZIPlib through 0.13.69. There is a memory
> leak triggered in the function __zzip_parse_root_directory in zip.c,
> which will lead to a denial of service attack.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...eak-from-__zzip_parse_root_directory.patch | 74 +++++++++++++++++++
>  ...k-from-__zzip_parse_root_directory-2.patch | 53 +++++++++++++
>  ...3-One-more-free-to-avoid-memory-leak.patch | 25 +++++++
>  package/zziplib/zziplib.mk                    |  5 ++
>  4 files changed, 157 insertions(+)
>  create mode 100644 package/zziplib/0001-Avoid-memory-leak-from-__zzip_parse_root_directory.patch
>  create mode 100644 package/zziplib/0002-Avoid-memory-leak-from-__zzip_parse_root_directory-2.patch
>  create mode 100644 package/zziplib/0003-One-more-free-to-avoid-memory-leak.patch

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
