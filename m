From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue, 26 Sep 2017 15:38:57 +0200
Subject: [Buildroot] [PATCH] package/turbolua: Fix build with gcc7
In-Reply-To: <20170926111421.jxcoydmadkqqp56i@tarshish>
References: <20170926103939.31965-1-m.niestroj@grinn-global.com>
 <20170926111421.jxcoydmadkqqp56i@tarshish>
Message-ID: <cd79b98c-0de2-cdd4-a342-42d2a918f4fa@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Thanks for review. I've already sent v2 version with requested changes.

On 26.09.2017 13:14, Baruch Siach wrote:
> Hi Marcin,
> 
> On Tue, Sep 26, 2017 at 12:39:39PM +0200, Marcin Niestroj wrote:
>> gcc7 has -Wimplicit-fallthrough enabled by default. Together with
>> -Werror in turbolua makefile it gives -Werror=implicit-fallthrough=
>> build error.
>>
>> Add upstreamable patch [1], which fixes typo in FALLTHROUGH comment,
>> so it makes the fallthrough explicit for gcc.
>>
>> [1] https://github.com/kernelsauce/turbo/pull/323
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/6f107b62f105508044185576b071323e5d73dd83
>> http://autobuild.buildroot.net/results/d303929960c667a21181d0bbdab64ba8a8d56a4f
>>
>> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
>> ---
>>   ...er-Fix-typo-in-switch-FALLTHROUGH-comment.patch | 27 ++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>   create mode 100644 package/turbolua/0001-http-parser-Fix-typo-in-switch-FALLTHROUGH-comment.patch
>>
>> diff --git a/package/turbolua/0001-http-parser-Fix-typo-in-switch-FALLTHROUGH-comment.patch b/package/turbolua/0001-http-parser-Fix-typo-in-switch-FALLTHROUGH-comment.patch
>> new file mode 100644
>> index 0000000000..a76f9cd5db
>> --- /dev/null
>> +++ b/package/turbolua/0001-http-parser-Fix-typo-in-switch-FALLTHROUGH-comment.patch
>> @@ -0,0 +1,27 @@
>> +From 201fbfbb034b01353de4de3813bdb9c6ec501bf7 Mon Sep 17 00:00:00 2001
>> +From: Marcin Niestroj <m.niestroj@grinn-global.com>
>> +Date: Tue, 26 Sep 2017 12:10:53 +0200
>> +Subject: [PATCH] http-parser: Fix typo in switch FALLTHROUGH comment
>> +
>> +This also suppresses -Wimplicit-fallthrough warning, which is enabled
>> +in gcc7 by default.
> 
> Please add your sign-off here.
> 
> Adding here the link to the upstream pull request would also be nice.
> 
>> +---
>> + deps/http-parser/http_parser.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/deps/http-parser/http_parser.c b/deps/http-parser/http_parser.c
>> +index 8cf6fb0..2ff1073 100644
>> +--- a/deps/http-parser/http_parser.c
>> ++++ b/deps/http-parser/http_parser.c
>> +@@ -2095,7 +2095,7 @@ http_parser_parse_url(
>> +       case s_req_server_with_at:
>> +         found_at = 1;
>> +
>> +-      /* FALLTROUGH */
>> ++      /* FALLTHROUGH */
>> +       case s_req_server:
>> +         uf = UF_HOST;
>> +         break;
> 
> baruch
> 

-- 
Marcin Niestroj
