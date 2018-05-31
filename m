From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Date: Thu, 31 May 2018 11:50:59 +0000
Subject: [Buildroot] [PATCH 4/4] linux: config.in: add comment for Arm
 Cortex-M
In-Reply-To: <9e5294e5-7d60-109a-b96e-0704f0092b7e@mind.be>
References: <1527761825-26682-1-git-send-email-christophe.priouzeau@st.com>
 <1527761825-26682-4-git-send-email-christophe.priouzeau@st.com>
 <9e5294e5-7d60-109a-b96e-0704f0092b7e@mind.be>
Message-ID: <71dc14dd-afa7-904a-15cf-594afc29de1e@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/31/2018 01:39 PM, Arnout Vandecappelle wrote:



On 31-05-18 12:17, Christophe PRIOUZEAU wrote:


When binutils > 2.28 are selected on Arm Cortex-M cpu,
linux kernel does not boot due to a new implementation
of 'adr pseudo instruction' on binutils.

Bugzilla thread: https://bugs.busybox.net/show_bug.cgi?id=11051

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com><mailto:christophe.priouzeau@st.com>
---
 linux/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 73a3299..fbd886c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -8,6 +8,10 @@ config BR2_LINUX_KERNEL

 if BR2_LINUX_KERNEL

+comment "Linux kernel will not boot with binutils >= 2.29"
+       depends on !BR2_ARMV7M
+       depends on BR2_BINUTILS_VERSION_2_28_X



 The logic is inverted here: it should be

        depends on BR2_ARMV7M
        depends on !BR2_BINUTILS_VERSION_2_28_X

 I guess you didn't test it?

Sorry, I have made the test with the patch on binutils/config.in, and I have inverted the value.
It's my fault.



 Regards,
 Arnout



+
 # Packages that need to have a kernel with support for loadable modules,
 # but do not use the kernel-modules infrastructure, should select that
 # option.






Regards
Christophe
--


Best regards / Cordialement,

[cid:part1.6C50213D.8A91E88A at st.com]
Christophe Priouzeau | TINA: 166 7320 | Tel: +33 244027320

STMicroelectronics
ST oneline: www.st.com<http://www.st.com>







-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180531/202a86fd/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: st_mail.png
Type: image/png
Size: 9916 bytes
Desc: st_mail.png
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180531/202a86fd/attachment.png>
