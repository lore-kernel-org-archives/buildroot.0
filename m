From: Lothar Felten <lothar.felten@gmail.com>
Date: Tue, 16 Aug 2016 10:31:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/simh: new package
In-Reply-To: <20160816035044.GB3368@tarshish>
References: <1471297357-11637-1-git-send-email-lothar.felten@gmail.com>
 <20160816035044.GB3368@tarshish>
Message-ID: <9ba51c53-ddb3-8a59-a3b0-9ba8e3e52f3e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On 16.08.2016 05:50, Baruch Siach wrote:
>
> There are fork() calls in the code, so this package might need a BR2_USE_MMU
> dependency.

Ok, I'll add that

>> diff --git a/package/simh/simh.mk b/package/simh/simh.mk
>> new file mode 100644
>> index 0000000..f650c69
>> --- /dev/null
>> +++ b/package/simh/simh.mk
>> @@ -0,0 +1,21 @@
>> +################################################################################
>> +#
>> +# simh
>> +#
>> +################################################################################
>> +
>> +SIMH_VERSION = e93b55b4887dfcf1d0dd6ff86f94470e42a10702
>> +SIMH_SITE = https://github.com/simh/simh
>> +SIMH_SITE_METHOD = git
>
> Please use the github helper. See
> http://nightly.buildroot.org/manual.html#github-download-url.
>
>> +SIMH_LICENSE = simh license
>
> Looking into a random source file like sim_imd.c, the license seems to be MIT.
> See https://opensource.org/licenses/MIT.

Most files have a MIT-license/disclaimer, a few files reference GNU GPL 
(Intel-Systems/common/i8088.c), at least one file is paritally 
zlib/libpng license (sim_video.c, line 102), one file is "licensed under 
the standard SimH license" (PDP11/pdp11_kmc.c), which seems to be MIT.

There's a Word .doc file doc/simh.doc that states:

COPYRIGHT NOTICE: The following copyright notice applies to the SIMH 
source, binary, and documentation (an then: MIT license)

An older PDF version is online:
http://simh.trailing-edge.com/pdf/simh_doc.pdf

Should I point to the simh.doc file?

Lothar
