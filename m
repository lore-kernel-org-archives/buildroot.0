From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 13 Feb 2015 10:39:50 +0100
Subject: [Buildroot] [PATCH] package/python: enable xml libraries
In-Reply-To: <CAGm1_ktnh-NfHS4mXQuE6gk+thaAyT1MB6xE38Km+jqKgW0Jog@mail.gmail.com>
References: <1423818347-3390-1-git-send-email-angelo.compagnucci@gmail.com>
 <CAGm1_ktnh-NfHS4mXQuE6gk+thaAyT1MB6xE38Km+jqKgW0Jog@mail.gmail.com>
Message-ID: <CA+TH9V=uZtCW8add7x0cuy90U_NFVkQpDLuJ-HQrQP=uu8iHdQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

2015-02-13 10:31 GMT+01:00 Yegor Yefremov <yegorslists@googlemail.com>:

>>
>> +config BR2_PACKAGE_PYTHON_XML
>> +       bool "xml module"
>> +       select BR2_PACKAGE_PYTHON_PYEXPAT
>> +       help
>> +         Xml libraries for Python
>> +
>
> What about this existing option?
>
> config BR2_PACKAGE_PYTHON_PYEXPAT
>         select BR2_PACKAGE_EXPAT
>         bool "pyexpat"
>         help
>           pyexpat module for Python.
>
> Yegor

Whithout BR2_PACKAGE_PYTHON_XML there is no way you can know exactly
when xml modules will be included or not without reading the configure
script.
Inedeed, python xml modules are included by the configure script only
if pyexpat is enabled.

BR2_PACKAGE_PYTHON_XML makes clear that if you want xml libraries, you
should select pyexpat.


-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
