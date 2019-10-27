From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 09:45:14 +0100
Subject: [Buildroot] [PATCH] package/file: add upstream security fix
In-Reply-To: <20191027074559.15727-1-peter@korsgaard.com>
References: <20191027074559.15727-1-peter@korsgaard.com>
Message-ID: <20191027094514.69d1eca2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 08:45:59 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security vulnerability:
> 
> - CVE-2019-18218: cdf_read_property_info in cdf.c in file through 5.37 does
>   not restrict the number of CDF_VECTOR elements, which allows a heap-based
>   buffer overflow (4-byte out-of-bounds write).
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...ation-overflow-when-computing-sector.patch | 68 +++++++++++++++++++
>  ...-of-elements-in-a-vector-found-by-os.patch | 62 +++++++++++++++++
>  2 files changed, 130 insertions(+)
>  create mode 100644 package/file/0001-Detect-multiplication-overflow-when-computing-sector.patch
>  create mode 100644 package/file/0002-Limit-the-number-of-elements-in-a-vector-found-by-os.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
