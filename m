From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 9 Mar 2017 21:47:49 -0800
Subject: [Buildroot] [PATCH 2/2] python3: Bump version to 3.6.0
In-Reply-To: <20170308000546.6f63414e@free-electrons.com>
References: <20170306224852.30968-1-andrew.smirnov@gmail.com>
 <20170306224852.30968-2-andrew.smirnov@gmail.com>
 <20170308000546.6f63414e@free-electrons.com>
Message-ID: <CAHQ1cqFM_L_Ksb1jr7V2gb7Mmj_5p8tbadYEFa=dSSy7Kfx-yQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 7, 2017 at 3:05 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon,  6 Mar 2017 14:48:52 -0800, Andrey Smirnov wrote:
>> Update all appropriate version numbers as well as SHAs and MD5s as well
>> as repbasing BR's patches on top of 3.6.0 codebase (new github repo
>> tree, v3.6.0 tag was used). Note that patches:
>>
>> [PATCH] Change the install location of _sysconfigdata.py
>> [PATCH] distutils/sysconfig: use sysconfigdata
>>
>> were dropped from the patchset since 3.6.0 codebase doesn't seem like it
>> has the problem that aforementioned patches were solving.
>
> It would be nice to have more details on how this sysconfigdata thing
> changed. I don't remember the details (it's been a long time), but I
> remember that thing being particularly being, so I would like to be
> extra cautious when getting rid of patches in the python(3) packages.

For patch #2, build system now adds platform specific suffix to
sysconfigdata's name, so each platform's file should have a unique
name and distutils now allows to specify which sysconfigdata is used
via _PYTHON_SYSCONFIGDATA_NAME

see:

https://github.com/python/cpython/commit/c4b53afce491142b80b228a21a05de5dcfd8d36f
https://github.com/python/cpython/commit/92dec548ff1494b86f08bd3753ca91a9330b4ea9

For patch #6, it looks like it some version of it already made it upstream:

https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85ffbb4b23d934159

Thanks,
Andrey Smirnov
