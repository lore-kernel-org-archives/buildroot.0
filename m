From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Mar 2019 23:27:24 +0100
Subject: [Buildroot] [PATCH v3 0/3] qt5webkit: fix build issue using
 system leveldb
In-Reply-To: <20190102205630.18725-1-gael.portay@collabora.com>
References: <20190102205630.18725-1-gael.portay@collabora.com>
Message-ID: <c4c22d85-4525-8c32-b4c0-dce3cadb51de@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Gael,

On 02/01/2019 21:56, Ga?l PORTAY wrote:
> This patchset fixes the build issue reported by autobuilder [0].
> 
>         /home/naourr/work/instance-2/output/build/qt5webkit-5.9.1/Source/WebCore//.obj/platform/leveldb/LevelDBDatabase.o: In function `WebCore::LevelDBDatabase::openInMemory(WebCore::LevelDBComparator const*)':
> LevelDBDatabase.cpp.text._ZN7WebCore15LevelDBDatabase12openInMemoryEPKNS_17LevelDBComparatorE+0x34): undefined reference to `leveldb::NewMemEnv(leveldb::Env*)'
>         collect2: error: ld returned 1 exit status
>         make[3]: *** [Makefile.api:97: ../lib/libQt5WebKit.so.5.9.1] Error 1
> 
> The issue happens when the package leveldb is enabled.

 Series applied to master, thanks. I renamed the patch because two other patches
to leveldb have been added in the meantime.

 Regards,
 Arnout
