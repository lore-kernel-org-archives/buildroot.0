From: Lada Trimasova <Lada.Trimasova@synopsys.com>
Date: Mon, 1 Feb 2016 12:40:41 +0000
Subject: [Buildroot] [PATCH v2] Trousers: disable pie option on ARC
In-Reply-To: <1453128253-17722-1-git-send-email-ltrimas@synopsys.com>
References: <1453128253-17722-1-git-send-email-ltrimas@synopsys.com>
Message-ID: <1454330441.2439.17.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2016-01-18 at 17:44 +0300, Lada Trimasova wrote:

ARC gcc understands "-pie" option and attempts to generate PIE
binaries as of today PIE is not really supported for user-space
applications.
So we provide option which checks if compiler understands relro
and pie options and disable PIE detection if building for ARC.
Also AUTORECONF option should be added because of modified
configure.in and Makefile.am files.

Signed-off-by: Lada Trimasova <ltrimas at synopsys.com<mailto:ltrimas@synopsys.com>>
Cc: Alexey Brodkin <abrodkin at synopsys.com<mailto:abrodkin@synopsys.com>>
Cc: Thomas Petazzoni <thomas.petazzoni at free-electrons.com<mailto:thomas.petazzoni@free-electrons.com>>
Cc: Peter Korsgaard <peter at korsgaard.com<mailto:peter@korsgaard.com>>

---
Changes v1 -> v2:
 - Check if compiler understands PIE_CFLAGS and RELRO_LDFLAGS
---



Please treat this as a polite reminder to review this patch sometime soon.

Regards,
Lada.
