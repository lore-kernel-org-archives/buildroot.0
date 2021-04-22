From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Apr 2021 23:49:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: fix build error due
 to undefined KMS_PLUGIN_LOCATION
In-Reply-To: <20210324090001.179735-1-egorenar@linux.ibm.com>
References: <20210324090001.179735-1-egorenar@linux.ibm.com>
Message-ID: <20210422234920.0054edd4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexander,

On Wed, 24 Mar 2021 10:00:01 +0100
Alexander Egorenkov <egorenar@linux.ibm.com> wrote:

> Fixes the following build error:
> kms.c:44:2: error: #error KMS_PLUGIN_LOCATION must be defined
>    44 | #error KMS_PLUGIN_LOCATION must be defined
>       |  ^~~~~
> /usr/bin/make -C ../..//libutil/ libutil.a
> kms.c: In function ?load_kms_plugin?:
> kms.c:274:5: error: ?KMS_PLUGIN_LOCATION? undeclared (first use in this function)
>   274 |     KMS_PLUGIN_LOCATION, so_name);
>       |     ^~~~~~~~~~~~~~~~~~~
> kms.c:274:5: note: each undeclared identifier is reported only once for each
> function it appears in
> 
> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
> ---
>  ...rror-when-the-compiler-flags-are-ove.patch | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 package/s390-tools/0002-zkey-Fix-build-error-when-the-compiler-flags-are-ove.patch

Thanks for the patch. However, another patch doing exactly the same
thing had been posted 2 days before, and has been applied on March 30.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
