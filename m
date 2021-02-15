From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Feb 2021 22:43:19 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/x265: update project URL
In-Reply-To: <20210215094134.2250-1-sebastien.szymanski@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?= Szymanski"'s message of "Mon, 15 Feb 2021
 10:41:34 +0100")
References: <20210215094134.2250-1-sebastien.szymanski@armadeus.com>
Message-ID: <874kidatxk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "S?bastien" == S?bastien Szymanski <sebastien.szymanski@armadeus.com> writes:

 > The project moved to https://bitbucket.org/multicoreware/x265_git
 > The archive file has changed (but not its content) so update the hashes
 > too.

 > Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
 > ---

 > Changes for v2:
 >  - update hashes

Sorry, but this is still not good. If I apply this, then the tarball on
sources.buildroot.net no longer has the right sha256sum, and if we
change the tarball then this breaks x265 download for all releases since
March 2020.

How about moving to the 3.4 release instead together with the change of
URL?

As we already have a copy on sources.buildroot.net of the 3.3 release it
isn't so bad that the upstream location failed as we automatically fall
back to sources.buildroot.net:

make x265-legal-info
>>> x265 3.3 Downloading
--2021-02-15 22:39:21--  https://bitbucket.org/multicoreware/x265/downloads/x265_3.3.tar.gz
Resolving bitbucket.org (bitbucket.org)... 104.192.141.1, 2406:da00:ff00::34cc:ea4a, 2406:da00:ff00::22c5:2ef4, ...
Connecting to bitbucket.org (bitbucket.org)|104.192.141.1|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2021-02-15 22:39:22 ERROR 404: Not Found.

--2021-02-15 22:39:22--  http://sources.buildroot.net/x265/x265_3.3.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 104.26.0.37, 172.67.72.56, 104.26.1.37, ...
Connecting to sources.buildroot.net (sources.buildroot.net)|104.26.0.37|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1438685 (1,4M) [application/x-gtar-compressed]
Saving to: ?/home/peko/source/buildroot/output/build/.x265_3.3.tar.gz.qy2qSJ/output?

/home/peko/source/buildroot/out 100%[======================================================>]   1,37M  --.-KB/s    in 0,1s

2021-02-15 22:39:25 (9,66 MB/s) - ?/home/peko/source/buildroot/output/build/.x265_3.3.tar.gz.qy2qSJ/output? saved [1438685/1438685]

x265_3.3.tar.gz: OK (md5: 0c8c747b59b5411dea8cf557554636c1)
x265_3.3.tar.gz: OK (sha256: f26e148ed1f4dfb33fd1eb3ff5e60e08078d1b2017e88bcbb045b3fb58300b9c)
>>> x265 3.3 Extracting
gzip -d -c /var/lib/downloads/x265/x265_3.3.tar.gz | tar --strip-components=1 -C /home/peko/source/buildroot/output/build/x265-3.3   -xf -
>>> x265 3.3 Patching

Applying 0001-fix-gcc-options.patch using patch:
patching file source/CMakeLists.txt
Hunk #1 succeeded at 217 (offset 23 lines).

Applying 0002-arm-asm-primitives.patch using patch:
patching file source/common/arm/asm-primitives.cpp
>>> x265 3.3 Collecting legal info
COPYING: OK (sha256: d8afb1bcc7a2cfc603683b168d6987ef0a48e59e0da3693bf55c5d33b67e2b49)

-- 
Bye, Peter Korsgaard
