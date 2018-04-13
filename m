From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 13 Apr 2018 11:32:52 +0200
Subject: [Buildroot] [PATCH 1/1] tcf-agent: bump to version 1.7.0
In-Reply-To: <20180413101341.52d0031e@windsurf>
References: <20180412151310.15252-1-eugene@largest.net>
 <20180413101341.52d0031e@windsurf>
Message-ID: <CADYdroNbVjuEk-4e_=WDs30v6sm9ZTvOb2_DtJdA9XLKQXZRBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-04-13 10:13 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:
>
> Please send follow-up patches to further improve things if needed.
> Moving from CMake to plain Makefiles is not really considered an
> improvement, unless it's the decision from upstream to move away from
> CMake.

There aren't any features of CMake used,
not for detecting libraries, not for detecting headers, not for getting flags,
all of this is missing compared to the Makefile. All that's there is a
subset of the fixed flags + logic from other buildsystems.
If that's an improvement for you, then there's not much left to discuss.

Proper CMake support would need all that (at which point it is surely
better than make),
and I expect you will get alot of warnings now in builds, since some
feature detection macros are missing.
I wont add proper CMake support myself (as I first considered it), as
I would have to dissect the information form other build-systems,
and keep it current every new version.

Norbert
