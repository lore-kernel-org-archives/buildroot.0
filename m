From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 3 Feb 2017 00:15:51 +0100
Subject: [Buildroot] [PATCH v6 9/9] package/python-pyqt5: add patch to
 fix build with Qt 5.8.0
In-Reply-To: <1485849551-20469-10-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <1485849551-20469-10-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <440fc7aa-0144-2c36-37ea-9e6139de71e0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31-01-17 08:59, Zoltan Gyarmati wrote:
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> ---
>  ...owOkButtonHint-and-WindowCancelButtonHint.patch | 27 ++++++++++++++++++++++

 This is potentially problematic. What if Qt 5.6 is used?

 Probably it's not a big issue, it just means you can't use these two classes
anymore in python, which is probably OK.

 Regards,
 Arnout

>  1 file changed, 27 insertions(+)
>  create mode 100644 package/python-pyqt5/0003-remove-WindowOkButtonHint-and-WindowCancelButtonHint.patch
> 
> diff --git a/package/python-pyqt5/0003-remove-WindowOkButtonHint-and-WindowCancelButtonHint.patch b/package/python-pyqt5/0003-remove-WindowOkButtonHint-and-WindowCancelButtonHint.patch
> new file mode 100644
> index 0000000..146cce0
> --- /dev/null
> +++ b/package/python-pyqt5/0003-remove-WindowOkButtonHint-and-WindowCancelButtonHint.patch
> @@ -0,0 +1,27 @@
> +From bb7cbdede46f72468bbb1b9bbefd43a1dbad21c0 Mon Sep 17 00:00:00 2001
> +From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> +Date: Mon, 30 Jan 2017 18:28:15 +0100
> +Subject: [PATCH] remove WindowOkButtonHint and WindowCancelButtonHint from
> + qnamespace.sip as they are removed from qt5.8
> +
> +Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> +---
> + sip/QtCore/qnamespace.sip | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/sip/QtCore/qnamespace.sip b/sip/QtCore/qnamespace.sip
> +index 2db83b7..559f410 100644
> +--- a/sip/QtCore/qnamespace.sip
> ++++ b/sip/QtCore/qnamespace.sip
> +@@ -209,8 +209,6 @@ namespace Qt
> +         WindowContextHelpButtonHint,
> +         WindowShadeButtonHint,
> +         WindowStaysOnTopHint,
> +-        WindowOkButtonHint,
> +-        WindowCancelButtonHint,
> +         WindowStaysOnBottomHint,
> +         WindowCloseButtonHint,
> +         MacWindowToolBarButtonHint,
> +-- 
> +2.7.4
> +
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
