From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Nov 2014 21:05:56 +0100
Subject: [Buildroot] [PATCH] Update github helper URL.
In-Reply-To: <54650D55.9060107@mind.be>
References: <1415908080-19350-1-git-send-email-iawillia@us.ibm.com>
 <54650D55.9060107@mind.be>
Message-ID: <54650F24.60707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/11/14 20:58, Arnout Vandecappelle wrote:
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

 Checked with a few tarballs, and it seems they only differ in the basename:

legacy (i.e., this patch):
	zeromq-cppzmq-1f05e0d/
current (i.e., archive/version.tar.gz):
	cppzmq-1f05e0d111197c64be32ad5aecd59f4d1b05a819/

 So the legacy really looks better :-)

 Therefore:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
