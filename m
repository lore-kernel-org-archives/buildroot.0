From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 08 Sep 2019 18:09:38 -0300
Subject: [Buildroot] [PATCH 03/27] package/gperf: bump to version 3.1
References: <20190908161003.25759-1-chrismcc@gmail.com>
Message-ID: <5d756e12315a4_61ff3fdbe4181f786765a@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

There are build failures on autobuilders possibly related to this bump.
See below.

On Sun, Sep 08, 2019 at 01:10 PM, Christopher McCrory wrote:

> 
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  package/gperf/gperf.hash | 4 +++-
>  package/gperf/gperf.mk   | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)

While testing an unrelated issue, I came across a build failure that seems
related somehow to this bump.

When testing based on current master (one patch after this one), I get a build
failure:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/290278807
With the same config but based on the commit just before this patch, the build
succeeds:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/290291133

Build failures are appearing on autobuilders:
http://autobuild.buildroot.net/?reason=host-libcap-2.25
I guess tomorrow 'Daily results' e-mail will show a plenty of them.

This is the error message:
>>> host-libcap 2.25 Building
...
In file included from <command-line>:0:0:
./_caps_output.gperf:71:80: error: unknown type name 'size_t'
 gperf_case_strncmp (register const char *s1, register const char *s2, register size_t n)
                                                                                ^~~~~~
...
Makefile:63: recipe for target 'cap_text.o' failed


Regards,
Ricardo
