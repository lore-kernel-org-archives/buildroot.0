From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 10 Mar 2017 15:05:01 +0000
Subject: [Buildroot] [PATCH] libepoxy: EGL dependency is mandatory
In-Reply-To: <20170310160137.6b2c30ef@free-electrons.com>
References: <20170310111150.9480-1-Vincent.Riera@imgtec.com>
 <20170310160137.6b2c30ef@free-electrons.com>
Message-ID: <09361e2f-d202-291b-bb56-41b59aca632b@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 10/03/17 15:01, Thomas Petazzoni wrote:
> Hello,
> 
> Cc'ing Gustavo, who said he would have a look at this issue.

he already was on CC.

> On Fri, 10 Mar 2017 11:11:50 +0000, Vicente Olivert Riera wrote:
>> The --disable-egl configure option doesn't exist:
>>
>> configure: WARNING: unrecognized options: [snip] --disable-egl
>>
>> If you don't have EGL support the configure script will fail like this:
>>
>> checking for EGL... no
>> configure: error: Package requirements (egl) were not met:
>>
>> Fixes:
>>   http://autobuild.buildroot.net/results/3eca5ba26a521f6cc5a611309ba066472af7769c
>>   http://autobuild.buildroot.net/results/cf9ec7da196d70548ae1413e4a3730314f6434d6
>>   http://autobuild.buildroot.net/results/069b80101afc4719db6d6d41cf5fc923be21ddc0
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>>  package/libepoxy/Config.in   | 6 +++---
>>  package/libepoxy/libepoxy.mk | 9 +--------
>>  2 files changed, 4 insertions(+), 11 deletions(-)
>>
>> diff --git a/package/libepoxy/Config.in b/package/libepoxy/Config.in
>> index c87366a..54b8272 100644
>> --- a/package/libepoxy/Config.in
>> +++ b/package/libepoxy/Config.in
>> @@ -1,12 +1,12 @@
>>  config BR2_PACKAGE_LIBEPOXY
>>  	bool "libepoxy"
>>  	select BR2_PACKAGE_XUTIL_UTIL_MACROS
>> -	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
>> +	depends on BR2_PACKAGE_HAS_LIBEGL
> 
> Really egl only is sufficient? This seems dubious. It doesn't need at
> least OpenGL ES ?

I have successfully build tested it without Xorg and without OpenGL ES
support (just OpenGL EGL).

Vincent

> Thomas
> 
