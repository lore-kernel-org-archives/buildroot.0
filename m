From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 1 Jun 2018 13:08:39 +0200
Subject: [Buildroot] [PATCH 2/2] package/expect: download tarball
 instead of cvs
In-Reply-To: <20180601110915.39e20638@windsurf>
References: <20180531070520.24242-1-arnout@mind.be>
 <20180531070520.24242-2-arnout@mind.be> <20180601110915.39e20638@windsurf>
Message-ID: <fcf0a77a-b84a-402e-d6fb-892d1f37851f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-06-18 11:09, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 31 May 2018 09:05:20 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
> 
>> diff --git a/package/expect/expect.hash b/package/expect/expect.hash
>> new file mode 100644
>> index 0000000000..c89f323906
>> --- /dev/null
>> +++ b/package/expect/expect.hash
>> @@ -0,0 +1,4 @@
>> +# From https://sourceforge.net/projects/expect/files/Expect/5.45.3/expect5.45.3.tar.gz.SHA256
>> +sha256  c520717b7195944a69ce1492ec82ca0ac3f3baf060804e6c5ee6d505ea512be9  expect5.45.3.tar.gz
>> +# Locally calculated
>> +sha256  b2415b17dc8d9a287f4509047ef5ac3436baef7ba7c50faef5222dcdf61a2bab  README
>> diff --git a/package/expect/expect.mk b/package/expect/expect.mk
>> index d78ff6c208..ccde33a71b 100644
>> --- a/package/expect/expect.mk
>> +++ b/package/expect/expect.mk
>> @@ -4,12 +4,13 @@
>>  #
>>  ################################################################################
>>  
>> -# Version 5.45.3
>> -EXPECT_VERSION = 2014-05-02
>> -EXPECT_SITE = cvs://expect.cvs.sourceforge.net:/cvsroot/expect
>> +EXPECT_VERSION = 5.45.3
>> +EXPECT_SITE = https://sourceforge.net/projects/expect/files/Expect/$(EXPECT_VERSION)
>> +EXPECT_SOURCE = expect$(EXPECT_VERSION).tar.gz
>>  EXPECT_LICENSE = Public domain
>>  EXPECT_LICENSE_FILES = README
> 
> Romain's autobuiler is not happy with this:
> 
>   http://autobuild.buildroot.net/results/dd2/dd29953f28577674070717cbb5feba8e12aad8e3/build-end.log
> 
> it downloads some html file. But the same URL downloaded here provides
> the correct tarball.

 Yeah, in Romain's autobuilder it is redirected to

https://sourceforge.net/#!/projects/expect/files/Expect/5.45.3/expect5.45.3.tar.gz

while locally I get

https://sourceforge.net/projects/expect/files/Expect/5.45.3/expect5.45.3.tar.gz/download

which is the right one...


 Regards,
 Arnout


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
