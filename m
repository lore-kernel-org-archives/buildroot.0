From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Nov 2018 23:15:29 +0100
Subject: [Buildroot] [PATCH] libtool: Make libltdl a separate package
In-Reply-To: <20181111221717.0855ea32@windsurf.home>
References: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
 <20181111221717.0855ea32@windsurf.home>
Message-ID: <56b213a9-830f-e08f-faba-401d7296e32c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/11/2018 22:17, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 11 Nov 2018 16:06:46 +0100, Alexander Sverdlin wrote:
>> This will save megabytes on the target filesystem if target packages only
>> require libltdl part of libtool.
>>
>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> 
> Thanks for this patch!
> 
> In fact, I don't think we need the full libtool on the target at all,
> so perhaps we should just change the existing libtool package in its
> target variant to only install libltdl ?
> 
> I see the following packages that have a dependency on target libtool:
> 
>  - clamav
>  - nut
>  - pulseaudio
>  - unixodbc
> 
> and all of them seem to have this dependency solely for libltdl.
> 
> Peter, Yann, Arnout, thoughts ?

 I agree. If anybody needs the rest of libtool, then we can add an option like
BR2_PACKAGE_LIBTOOL_FULL or _TOOLS or something like that, similar to e.g.
libcurl (where BTW curl was originally a separate package but we merged it).

 Regards,
 Arnout
