From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 01 Nov 2014 23:06:23 +0100
Subject: [Buildroot] [PATCH] infra: Add a way to apply patches using git
In-Reply-To: <20141101224721.29b22269@free-electrons.com>
References: <1404321605-20073-1-git-send-email-jezz@sysmic.org>
 <20141101224721.29b22269@free-electrons.com>
Message-ID: <5455595F.6090205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/11/14 22:47, Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
> 
> On Wed,  2 Jul 2014 19:20:05 +0200, J?r?me Pouiller wrote:
>> This option is mainly used for package developpers. When activated,
>> Buildroot will automaticaly create a git repository for each package
>> it extract. Initial version is tagged as `upstream'. Next, during
>> patch step, git is used instead of patch. BTW, patches are easier
>> to modify/fix/rebase/cherry-pick/upstream. Once satisfied with
>> changes, developper may use
>>     git format-patch -o $TOPDIR/package/$PKG upstream
>> to save its patches to Buildroot.
>>
>> Notice this option should be compatible with `guilt' (a clone of
>> `quilt')
>>
>> Notice you can also use this feature for a specific package using
>>     make BR2_USE_GIT_TO_PATCH=y $PKG-dirclean $PKG-patch
>>
>> Current known limitations:
>>   - If a patch cannot be handled by `git am', we use `git apply`. In
>>     this case, patch description is not reported in commit message.
>>   - When patch is handled with `git apply`, subject used may not be
>>     perfect (it is extracted from patch filename)
>>   - `git format-patch' does not prefix patch files with name of package.
>>   - If upstream was downloaded with git, we may also run
>>     `git remote add $($(PKG)_SITE)' during git repository creation
>>
>> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> 
> We discussed this proposal at the last Buildroot Developers meeting.
> Even though we understand the idea and some of us found it potentially
> interesting, we didn't really like the implementation, but nobody
> really found a way of implementing something like this in a nice way.
> 
> One of the problem is that not all our patches are Git patches, which
> you had to work-around in your patch in a way that isn't really nice.
> 
> Maybe Arnout and Yann (in Cc) remember more of the issues that we
> discussed at the meeting regarding this proposal.

 For simple patches, a simple diff is normally sufficient. For more complicated
stuff, it is really worthwhile to clone the upstream repository and work from
there - you'll anyway need to do that to upstream the patches.

 So we felt that the need for this feature did not outweigh the complexity of
its implementation.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
