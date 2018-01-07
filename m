From: Matthew Weber <matt@thewebers.ws>
Date: Sat, 6 Jan 2018 18:14:13 -0600
Subject: [Buildroot] [PATCH v2 1/1] python-xlib: new package
In-Reply-To: <20180106151308.7b5765f7@windsurf>
References: <20180105000420.20152-1-joseph.kogut@gmail.com>
 <20180105211307.25071-1-joseph.kogut@gmail.com>
 <20180106151308.7b5765f7@windsurf>
Message-ID: <CAFt09wP3=EyhxW58DAAOQ4V6Gho=KCJyztExhZzwkn27Q0T-Xw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joseph,

On Sat, Jan 6, 2018 at 8:13 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri,  5 Jan 2018 13:13:07 -0800, Joseph Kogut wrote:
>> Thanks for the review, Yegor!
>>
>> Changes since v1:
>> - added runtime tag to python-six Config dependency
>> - remove unneeded command and newline from python-xlib.hash
>> - added host-python-setuptools-scm to build dependencies
>> - removed setup.py patch
>
> This personal message and changelog should have gone...
>
>>
>> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
>> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>
> ... here, so that Git doesn't include it as part of the commit log.
> Indeed, we don't need to keep such details in the Git history (but they
> are very useful to have during the patch review process).
>
>> +PYTHON_XLIB_VERSION = 0.21
>> +PYTHON_XLIB_SOURCE = python-xlib-$(PYTHON_XLIB_VERSION).tar.bz2
>> +PYTHON_XLIB_SITE = https://pypi.python.org/packages/eb/de/b0eaaea7b8512dc41504db071824eef30293ff55c58d83081ebaebe85a38
>> +PYTHON_XLIB_SETUP_TYPE = setuptools
>> +PYTHON_XLIB_LICENSE = LGPL-2.0+
>
> The license is in fact LGPL-2.1+, so I've fixed that and applied your
> patch to the master branch.
>

Looks like license hash was updated and the legal-info integrity check
causes the following failure.  I'll send a quick patch tonight to keep
the builders going.

http://autobuild.buildroot.net/results/762/7627e9da786852d6b08e2fc6092a5ce3ba2f4ea0//

-- 
Thanks,
Matt
