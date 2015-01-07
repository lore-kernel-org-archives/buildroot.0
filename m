From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 7 Jan 2015 17:51:21 +0100
Subject: [Buildroot] [PATCH v3] svgtiny: update source url
In-Reply-To: <20150105173402.41315fcb@free-electrons.com>
References: <1420455729-15649-1-git-send-email-fabio.porcedda@gmail.com>
 <20150105141547.0daa89c8@free-electrons.com>
 <CAHkwnC_aRYSYQE-b_rdOCoe5u9U+Stq1VZ6nZEdmjkv+nArQeg@mail.gmail.com>
 <20150105173402.41315fcb@free-electrons.com>
Message-ID: <CAHkwnC_T_GV0_WhOvgUgN5Mkq4a5SkPTiy+c-1R6Uz=K6v4+Pw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 5, 2015 at 5:34 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Mon, 5 Jan 2015 15:29:06 +0100, Fabio Porcedda wrote:
>
>> Yes, the repository is:
>> http://git.netsurf-browser.org/buildsystem.git/
>>
>> But those sources alone do nothing, the build and install target of
>> this package will be empty.
>> Also to use those files at least a symbolic link must be added to the
>> libsvgtiniy directory to access buildsystem.git files.
>> Considering all of this it is still preferably worth adding a separate
>> package for those files?
>
> Yes, I personally believe it's preferable to have a separate package.
> Create a netsurf-buildsystem package, which installs those files to
> $(STAGING_DIR)/usr/share/netsurf-buildsystem/ for example. Then
> libsvgtiny would depend on netsurf-buildsystem, and in a post-extract
> hook, create the necessary symlink.

Ok.

> Not sure if netsurf-buildsystem should be a target package (and install
> its stuff to staging) or a host package (and install its stuff to
> HOST_DIR).

IMHO it's a build tool like autoconf, automake, so it's a host package.

BR
-- 
Fabio Porcedda
