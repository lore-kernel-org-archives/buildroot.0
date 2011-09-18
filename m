From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Sep 2011 22:54:53 +0200
Subject: [Buildroot] [PATCH 8/8] Add support for the RTAI real-time
	extension
In-Reply-To: <7866cdfadfff98de581f66937b224319f83bc681.1316290714.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 17 Sep 2011 22:22:58 +0200")
References: <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
 <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
 <7866cdfadfff98de581f66937b224319f83bc681.1316290714.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87zki1606a.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  linux/Config.ext.in     |   13 +++++++++++++
 Thomas>  linux/linux-ext-rtai.mk |   47 +++++++++++++++++++++++++++++++++++++++++++++++
 Thomas>  package/Config.in       |    1 +
 Thomas>  package/rtai/Config.in  |    2 ++
 Thomas>  package/rtai/rtai.mk    |   16 ++++++++++++++++
 Thomas>  5 files changed, 79 insertions(+), 0 deletions(-)
 Thomas>  create mode 100644 linux/linux-ext-rtai.mk
 Thomas>  create mode 100644 package/rtai/Config.in
 Thomas>  create mode 100644 package/rtai/rtai.mk

 Thomas> +++ b/package/rtai/Config.in
 Thomas> @@ -0,0 +1,2 @@
 Thomas> +config BR2_PACKAGE_RTAI
 Thomas> +        bool "rtai"

Wrong indentation, no help text and should depend on
BR2_LINUX_KERNEL_EXT_RTAI.

I've fixed that and committed, thanks.

-- 
Bye, Peter Korsgaard
