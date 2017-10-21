From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 21 Oct 2017 15:12:21 +0200
Subject: [Buildroot] [PATCH RFC] package/glibc: switch to using the
 maintenance branch
In-Reply-To: <20171021122223.GB7022@scaer>
References: <20171021102206.29477-1-yann.morin.1998@free.fr>
 <38b149b1-8f27-d747-3b16-be54b43cdbd4@gmail.com>
 <20171021122223.GB7022@scaer>
Message-ID: <5b08873b-fd57-5852-7920-3afc25368c0d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 21/10/2017 ? 14:22, Yann E. MORIN a ?crit?:
> Romain, All,
> 
> On 2017-10-21 13:31 +0200, Romain Naour spake thusly:
>> Le 21/10/2017 ? 12:22, Yann E. MORIN a ?crit?:
>>> glibc upstream has srued against doing regular point-releases, but they
>> sued
>>> do have a lot of interesting and important fixes for regressions and
>>> security.
>>>
>>> Backporting each patch, or cherry-picking individual patches is offf
>> off
>>> limits for us, so we just switch to using the currently-latest HEAD of
>>> the maintenance branch instead.
>>
>> Since it's not a simple switch but also a version bump. It would be great if we
>> can list interesting fixed issues.
> 
> Well, I wouldn't bother with that, beause we do not ususally do such
> listing for other packages.
> 
> It would be indeed nice to list the "big" changes, but really I'm not
> willing to do that.

Ok, I'm saying that since another patche fixing C++ issues related to float128
has landed after the last patch I backported.

For example:
https://sourceware.org/git/?p=glibc.git;a=commit;h=3b10c5d2abb0392d5ecfd865e2eb911ac109e36f

Or you can just copy the NEWS file entry ?

> 
>>> The version number is obtained with:
>>>     $ git describe --match 'glibc-*' --abbrev=40 origin/release/2.26/master
>>>
>>> The alternative options were:
>>>   - download the tarball from the git tree
>>>     --> does nto work; not an option
>>>   - download the 2.26 tarball, and bundle the individual patches in
>>>     Buildroot
>>>     --> maintenance of patches is a burden; not an option
>>>   - download the 2.26 tarball, maintain the list of patches to download from
>>>     the git tree
>>>     --> not an option for the same reason
>>>
>>> So we end up just doing a git clone. The git tree is today about ten
>>> times the size of the tarball, so a rough estimate makes it at about ten
>>> times the download time.
>>
>> I can't clone this repo from here using https:
>>
>> error: Unable to get pack index
>> https://sourceware.org/git/glibc.git/objects/pack/pack-f7640727c0f4d6c3389f46d7d6540bbd74f2c136.idx
>> error: Failed to connect to sourceware.org port 443: Connection timed out
>> (curl_result = 7, http_code = 0, sha1 = eb4488dc33fedcd7cdb5907a82f18f1d300d533b)
>> error: Unable to find a1fd1e8a3e17d0f846df142d93aa2af0bc16ced0 under
>> https://sourceware.org/git/glibc.git
> 
> As seen on IRC, you've solved your issue, right?

Right, the build succeed here.

> 
> Regards,
> Yann E. MORIN.
> 
>> I guess it's a gitconfig issue. Maybe I should increase a buffer somewhere.
>>
>> Otherwise, it looks good.
>>
>> Note: My patch fixing gcc5.5 x86_64 toolchains whith glibc 2.26 is not yet
>> backported to the stable branch.
>> Maintainers are waiting some days before backporting a patch.
>>
>> https://sourceware.org/git/?p=glibc.git;a=commit;h=386e1c26ac473d6863133ab9cbe3bbda16c15816
>>
>> Maybe you can include it in this patch.
> 
> No, I won't. This commit is about just switching (and bumping as you
> noticed). We can wait a bit more until your commit is applied and when
> we're ready to tag 2017.11-rc1, and then bump to the latest HEAD of the
> branch.

Ok, I'll ask upstream if the patch can be backported in the next days.

Best regards,
Romain

> 
> Regards,
> Yann E. MORIN.
> 
