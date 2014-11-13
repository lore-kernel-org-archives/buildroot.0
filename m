From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 13 Nov 2014 21:06:27 +0100
Subject: [Buildroot] [PATCH] Update github helper URL.
In-Reply-To: <54650D55.9060107@mind.be>
References: <1415908080-19350-1-git-send-email-iawillia@us.ibm.com>
 <54650D55.9060107@mind.be>
Message-ID: <CAAXf6LWNoKjSPRrjpDROBHK6xvqC1cP6BsybRuMX64veGOTc7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 13, 2014 at 8:58 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 13/11/14 20:48, Patrick Williams wrote:
>> Github changed the URL syntax from 'archive' back to 'tarball'.
>>
>> Signed-off-by: Patrick Williams <iawillia@us.ibm.com>
>> ---
>>  package/pkg-download.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
>> index 4cfb913..03907f1 100644
>> --- a/package/pkg-download.mk
>> +++ b/package/pkg-download.mk
>> @@ -56,7 +56,7 @@ notdomain=$(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$(c
>>  domainseparator=$(if $(1),$(1),/)
>>
>>  # github(user,package,version): returns site of GitHub repository
>> -github = https://github.com/$(1)/$(2)/archive/$(3)
>> +github = https://github.com/$(1)/$(2)/tarball/$(3)
>>
>>  ################################################################################
>>  # The DOWNLOAD_* helpers are in charge of getting a working copy
>>
>
>  Yep, that seems to work! So Yann, stop working :-)
>
>  I haven't tested if it's exactly the same tarball. It redirects to a URL
> containing legacy.tar.gz instead of tar.gz, so who knows...

I can't follow all this madness.

>>> a10disp a899cc6dcf909360aac00482ede5369f3656f226 Downloading
--2014-11-13 20:57:54--
https://github.com/hglm/a10disp/archive/a899cc6dcf909360aac00482ede5369f3656f226/a10disp-a899cc6dcf909360aac00482ede5369f3656f226.tar.gz
Resolving github.com (github.com)... 192.30.252.129
Connecting to github.com (github.com)|192.30.252.129|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://codeload.github.com/hglm/a10disp/tar.gz/a899cc6dcf909360aac00482ede5369f3656f226
[following]
--2014-11-13 20:57:54--
https://codeload.github.com/hglm/a10disp/tar.gz/a899cc6dcf909360aac00482ede5369f3656f226
Resolving codeload.github.com (codeload.github.com)... 192.30.252.146
Connecting to codeload.github.com
(codeload.github.com)|192.30.252.146|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [application/x-gzip]

Here the original URL with 'archive' still works. So what's the fuzz about?
