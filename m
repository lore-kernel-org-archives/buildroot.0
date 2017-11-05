From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Nov 2017 10:20:34 +0100
Subject: [Buildroot] [PATCH 1/1] zlib-ng: new package
In-Reply-To: <20171104212316.GA4491@gmail.com>
References: <1509690851-23677-1-git-send-email-stefan.froberg@petroprogram.com>
 <20171104212316.GA4491@gmail.com>
Message-ID: <187139c4-b732-7bc1-f7d2-30527eb9d181@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-11-17 22:23, Marcus Folkesson wrote:
> Hi Stefan,
> 
> On Fri, Nov 03, 2017 at 06:34:11AM +0000, Stefan Fr?berg wrote:
[snip]
>> +ZLIB_NG_SITE = https://github.com/Dead2/zlib-ng.git
>> +ZLIB_NG_SOURCE = develop.zip
> 
> I guess the intention is to point to
> ZLIB_NG_SITE = https://github.com/Dead2/zlib-ng/archive
> 
> Otherwise it will try to download
> http://github/Dead2/zlib-ng.git/develop.zip
> which is incorrect.
> 
> However, this will result in a file ./dl/develop.zip, which says nothing
> about package or version.
> 
> I think it is better to use git:
> ZLIB_NG_SITE_METHOD = git

 No, use the github helper [1]. And don't download the zip file, download the
tarball. And add a hash file. Make sure the hash file contains a hash for the
license file as well.


 Regards,
 Arnout

[1] https://buildroot.org/downloads/manual/manual.html#github-download-url

> 
> and specify version
> ZLIB_NG_VERSION = xxxxx
> 
> 
>> +ZLIB_NG_SUBDIR = zlib-ng-develop
>> +ZLIB_NG_EXTRACT_CMDS = unzip $(DL_DIR)/$(ZLIB_NG_SOURCE) -d $(ZLIB_NG_DIR)
> 
> This is affected by the comment above
> 
>> +ZLIB_NG_LICENSE = Zlib
>> +ZLIB_NG_LICENSE_FILES = README.md
> 
> The license file is LICENSE.md, not README.md.
> 
> 
> Best regards
> Marcus Folkesson
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
