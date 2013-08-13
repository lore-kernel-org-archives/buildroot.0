From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Aug 2013 18:40:42 +0200
Subject: [Buildroot] [PATCH v2] pkg-download: take some more care of
 <PKG_>VERSION with git
In-Reply-To: <20130813121539.58b5e801@skate>
References: <1364931609-2459-1-git-send-email-Patrick.Boettcher@parrot.com>
 <20130813121539.58b5e801@skate>
Message-ID: <520A618A.7060005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/08/13 12:15, Thomas Petazzoni wrote:
> Hello,
>
> On Tue,  2 Apr 2013 21:40:08 +0200, Patrick Boettcher wrote:
>> This replaces the one-liner patch I made last week after a comment by
>> Thomas De Schampheleire. (it is now a 5-liner)
>>
>> I added comment to explain why using HEAD is better in the current
>> situation. I did not change the hg-part as it is different to git -
>> after a quick read it won't work at all when VERSION is not set in a
>> packge.
>>
>> Please apply if appropriate and helpful (it is for me).
>>
>> Patrick Boettcher (1):
>>    pkg-download: take some more care of <PKG_>VERSION when METHOD is git
>>
>>   package/pkg-download.mk |    6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> Thomas, Arnout, Gustavo, some thoughts about this patch?
>
> I'm not a big fan of the fact that <pkg>_VERSION would be optional for
> the git site method, but mandatory for the hg site method, but it's not
> really a strong opinion.

  Considering the commit message of 3a7a0a which you just committed:

"Specifying a floating tag like HEAD for a repository version is bad 
practice, as it results in non-reproducible builds."

I would say this is a bad idea. Instead, there could be a check that 
PKG_VERSION is not empty.


  Also, I think the patch is just wrong: if you specify a sha instead of 
a branch or tag, then it will check out master's HEAD instead of the 
specified sha...


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
