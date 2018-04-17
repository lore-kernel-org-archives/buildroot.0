From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Apr 2018 13:41:08 +0200
Subject: [Buildroot] [PATCH 1/1] libcurl: fix building against libressl
In-Reply-To: <20180415204327.5bc05597@windsurf.numericable.fr>
References: <20180413123931.7604-1-aduskett@gmail.com>
 <20180415204327.5bc05597@windsurf.numericable.fr>
Message-ID: <c5a388fe-9d06-15b5-0bc1-a4bf23890b19@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-04-18 20:43, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 13 Apr 2018 08:39:31 -0400, Adam Duskett wrote:
>> LibreSSL 2.7.x breaks libcurl 7.59.0 with the error:
>> error: static declaration of ?OpenSSL_version_num? follows non-static
>> declaration
>>
>> This failure has since been fixed upstream with commit:
>> https://github.com/curl/curl/commit/7c90c93c0b061da81f69fabdd57125b2783c15fb
>>
>> Signed-off-by: Adam Duskett <aduskett@gmail.com>
>> ---
>>  ...-curl-fix-building-against-libressl-2.7.2.patch | 91 ++++++++++++++++++++++
>>  1 file changed, 91 insertions(+)
>>  create mode 100644 package/libcurl/0001-curl-fix-building-against-libressl-2.7.2.patch
>>
>> diff --git a/package/libcurl/0001-curl-fix-building-against-libressl-2.7.2.patch b/package/libcurl/0001-curl-fix-building-against-libressl-2.7.2.patch
>> new file mode 100644
>> index 0000000000..e5d6f686e8
>> --- /dev/null
>> +++ b/package/libcurl/0001-curl-fix-building-against-libressl-2.7.2.patch
>> @@ -0,0 +1,91 @@
>> +From 7a67b6561da8e42505e09014a5c97b19e1a93532 Mon Sep 17 00:00:00 2001
>> +From: Adam Duskett <aduskett@gmail.com>
>> +Date: Fri, 13 Apr 2018 08:31:37 -0400
>> +Subject: [PATCH] curl: fix building against libressl 2.7.2
> 
> Since the issue has been fixed upstream, the fix should be a backport
> from upstream commit, not a different commit authored by you.
> 
> I.e:
> 
> $ git clone https://github.com/curl/curl.git
> $ cd curl/
> $ git checkout curl-7_59_0
> $ git cherry-pick 7c90c93c0b061da81f69fabdd57125b2783c15fb

 Use git cherry-pick -x -s. This will add your Sob right away, and it will
record the upstream commit from which it was taken.

> $ git format-patch HEAD^

 And here, of course, you need to add -N (well, not in this case since it's just
a single patch, but in general).


> and then edit the patch to add your Signed-off-by below the one from
> the original author, and use that in package/libcurl/.
> 
> Could you rework your patch by doing this ? I could have done it
> myself, but I preferred to explain the process for doing it properly :)

 This should be added to the manual...

 Regards,
 Arnout

> 
> Thanks!
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
