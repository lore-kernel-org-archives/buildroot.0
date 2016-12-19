From: Andreas Naumann <dev@andin.de>
Date: Mon, 19 Dec 2016 10:50:55 +0100
Subject: [Buildroot] [PATCH v3 2/7] qt5: bump to 5.8.0-rc
In-Reply-To: <20161216213045.25395802@gmx.net>
References: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
 <1481641171-10407-3-git-send-email-anaumann@ultratronik.de>
 <20161216213045.25395802@gmx.net>
Message-ID: <74ec7f27-fa35-e9cf-5310-cd27ded770a7@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 16.12.2016 um 21:30 schrieb Peter Seiderer:
> Hello Andreas,
>
> On Tue, 13 Dec 2016 15:59:26 +0100, Andreas Naumann <anaumann@ultratronik.de> wrote:
>
>
>> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
>> index 7840a6e..79ad868 100644
>> --- a/package/qt5/qt5base/qt5base.mk
>> +++ b/package/qt5/qt5base/qt5base.mk
>> @@ -41,12 +41,10 @@ else
>>  QT5BASE_CONFIGURE_OPTS += -release
>>  endif
>>
>> -QT5BASE_CONFIGURE_OPTS += -largefile
>> -
>>  ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
>>  QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
>> -QT5BASE_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
>> -QT5BASE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
>> +QT5BASE_LICENSE = GPLv2 or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
>> +QT5BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
>>  else
>>  QT5BASE_LICENSE = Commercial license
>>  QT5BASE_REDISTRIBUTE = NO
>
>
> I think it should be 'GPLv2+ or LGPLv3' for core/qtbase, see e.g (random) source file
> header root/src/corelib/kernel/qabstracteventdispatcher.h ([1]):
>
> ** $QT_BEGIN_LICENSE:LGPL$
> ** Commercial License Usage
> ** Licensees holding valid commercial Qt licenses may use this file in
> ** accordance with the commercial license agreement provided with the
> ** Software or, alternatively, in accordance with the terms contained in
> ** a written agreement between you and The Qt Company. For licensing terms
> ** and conditions see https://www.qt.io/terms-conditions. For further
> ** information use the contact form at https://www.qt.io/contact-us.
> **
> ** GNU Lesser General Public License Usage
> ** Alternatively, this file may be used under the terms of the GNU Lesser
> ** General Public License version 3 as published by the Free Software
> ** Foundation and appearing in the file LICENSE.LGPL3 included in the
> ** packaging of this file. Please review the following information to
> ** ensure the GNU Lesser General Public License version 3 requirements
> ** will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
> **
> ** GNU General Public License Usage
> ** Alternatively, this file may be used under the terms of the GNU
> ** General Public License version 2.0 or (at your option) the GNU General
> ** Public license version 3 or any later version approved by the KDE Free
> ** Qt Foundation. The licenses are as published by the Free Software
> ** Foundation and appearing in the file LICENSE.GPL2 and LICENSE.GPL3
> ** included in the packaging of this file. Please review the following
> ** information to ensure the GNU General Public License requirements will
> ** be met: https://www.gnu.org/licenses/gpl-2.0.html and
> ** https://www.gnu.org/licenses/gpl-3.0.html.
> **
> ** $QT_END_LICENSE$

Thanks for pointing that out. For my changes I mainly used the entry in 
dist/changes-5.7.0 and I somehow overread the words "and later" in
  * GNU General Public License v2.0 (LICENSE.GPL2) and later

>
> On the Qt website only LGPLv3 and GPLv3 are mentioned ([2]), the licenses
> overview image at [3] says 'GPLGv2+/LGPLv3'.

According to your posted example header we can assume the later is 
correct right?

>
> The Qt examples are licensed under BSD ([4])....

As can be seen in [2] lot of modules are licensed under BSD, MIT, Apache 
and so on. Do we have to list them all?


regards,
Andreas


>
> Regards,
> Peter
>
> [1] https://code.qt.io/cgit/qt/qtbase.git/tree/src/corelib/kernel/qabstracteventdispatcher.h
> [2] http://doc.qt.io/qt-5/licensing.html
> [3] https://www.ics.com/blog/changes-qt-licensing
> [4] https://code.qt.io/cgit/qt/qtbase.git/tree/examples/gui/analogclock/main.cpp
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
