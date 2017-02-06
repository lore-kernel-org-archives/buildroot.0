From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Mon, 6 Feb 2017 09:57:34 +0100
Subject: [Buildroot] [PATCH v6 9/9] package/python-pyqt5: add patch to
 fix build with Qt 5.8.0
In-Reply-To: <440fc7aa-0144-2c36-37ea-9e6139de71e0@mind.be>
References: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <1485849551-20469-10-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <440fc7aa-0144-2c36-37ea-9e6139de71e0@mind.be>
Message-ID: <2cec291c-c9ae-7c21-ff8e-bbb6ba8d53b8@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout, Peter, Thomas,


ok, thanks for the feedbacks, I'll tailor together a new version in the
upcoming days,


regards

Zoltan Gyarmati
https://zgyarmati.de

On 02/03/2017 12:15 AM, Arnout Vandecappelle wrote:
>
> On 31-01-17 08:59, Zoltan Gyarmati wrote:
>> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
>> ---
>>  ...owOkButtonHint-and-WindowCancelButtonHint.patch | 27 ++++++++++++++++++++++
>  This is potentially problematic. What if Qt 5.6 is used?
>
>  Probably it's not a big issue, it just means you can't use these two classes
> anymore in python, which is probably OK.
>
>  Regards,
>  Arnout
>
>>  1 file changed, 27 insertions(+)
>>  create mode 100644 package/python-pyqt5/0003-remove-WindowOkButtonHint-and-WindowCancelButtonHint.patch
>>
>> diff --git a/package/python-pyqt5/0003-remove-WindowOkButtonHint-and-WindowCancelButtonHint.patch b/package/python-pyqt5/0003-remove-WindowOkButtonHint-and-WindowCancelButtonHint.patch
>> new file mode 100644
>> index 0000000..146cce0
>> --- /dev/null
>> +++ b/package/python-pyqt5/0003-remove-WindowOkButtonHint-and-WindowCancelButtonHint.patch
>> @@ -0,0 +1,27 @@
>> +From bb7cbdede46f72468bbb1b9bbefd43a1dbad21c0 Mon Sep 17 00:00:00 2001
>> +From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
>> +Date: Mon, 30 Jan 2017 18:28:15 +0100
>> +Subject: [PATCH] remove WindowOkButtonHint and WindowCancelButtonHint from
>> + qnamespace.sip as they are removed from qt5.8
>> +
>> +Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
>> +---
>> + sip/QtCore/qnamespace.sip | 2 --
>> + 1 file changed, 2 deletions(-)
>> +
>> +diff --git a/sip/QtCore/qnamespace.sip b/sip/QtCore/qnamespace.sip
>> +index 2db83b7..559f410 100644
>> +--- a/sip/QtCore/qnamespace.sip
>> ++++ b/sip/QtCore/qnamespace.sip
>> +@@ -209,8 +209,6 @@ namespace Qt
>> +         WindowContextHelpButtonHint,
>> +         WindowShadeButtonHint,
>> +         WindowStaysOnTopHint,
>> +-        WindowOkButtonHint,
>> +-        WindowCancelButtonHint,
>> +         WindowStaysOnBottomHint,
>> +         WindowCloseButtonHint,
>> +         MacWindowToolBarButtonHint,
>> +-- 
>> +2.7.4
>> +
>>


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170206/a63c157e/attachment-0001.asc>
