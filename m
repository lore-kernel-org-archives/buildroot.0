From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 Oct 2019 13:16:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/libzip: fix build with musl-fts
In-Reply-To: <CAPi7W80UqrmGemukyZrSX8qTceTRSoc3TwFmS9ssXgCfv+x0Ew@mail.gmail.com>
References: <20191011172615.2242-1-fontaine.fabrice@gmail.com>
 <03c2ce97-f795-ee85-9e4a-34663d363226@mind.be>
 <CAPi7W80UqrmGemukyZrSX8qTceTRSoc3TwFmS9ssXgCfv+x0Ew@mail.gmail.com>
Message-ID: <b49dd436-5174-5f3a-3c4c-e706c73e0430@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/10/2019 23:59, Fabrice Fontaine wrote:
> Dear Arnout,
> 
> Le ven. 11 oct. 2019 ? 22:09, Arnout Vandecappelle <arnout@mind.be> a ?crit :
>>
>>
>>
>> On 11/10/2019 19:26, Fabrice Fontaine wrote:
>>> Fixes:
>>>  - http://autobuild.buildroot.org/results/89f5fc111bb8bcecbe05ab79d62ac809094b6ce1
>>
>>  Ha, we didn't think of that when adding musl-fts... Packages that check for
>> fts.h may now fail to build because they find fts.h but don't link with -lfts...
> There is another interesting issue due to musl-fts on elfutils
> (http://autobuild.buildroot.org/results/ef3/ef3ec5aaef2b26c9947f403d2672b0f9beafd6db/build-end.log):
> 
> In file included from linux-kernel-modules.c:67:0:
> /data/buildroot/buildroot-test/instance-0/output/host/m68k-buildroot-linux-uclibc/sysroot/usr/include/fts.h:149:6:
> error: conflicting types for 'fts_set'
>  int  fts_set(FTS *, FTSENT *, int);
>       ^~~~~~~

 We do that unto ourselves with patch 0002...

 Regards,
 Arnout
