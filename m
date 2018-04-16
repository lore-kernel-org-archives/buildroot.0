From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 16 Apr 2018 00:04:21 -0300
Subject: [Buildroot] [RFC PATCH 3/3] download/git: unshallow when
 fetching all refs
References: <20180415120804.GB21958@scaer>
Message-ID: <5ad412b5b7257_5cd73ffcbe60c7f099117@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Apr 15, 2018 at 09:08 AM, Yann E. MORIN wrote:

>> The worst scenario (linux trees) is covered by:
>> - the use of tarballs from GitHub in the defconfigs, for newcomers who sometimes
>>   just want to use a defconfig, add few packages and use the image in a new
>>   board;
>> - in the long run, due to the git cache feature.
>> 
>> But I think people will miss this feature. At least I will.
> 
> Except for the linux git tree and a very few other packages we get from
> git, most git tree are reasonably sized, so that the overhead of doign a
> full clone is not much as comp[ared to the shallow clone.
> 
> And since it also makes our code much simpler and more maintaineable,

Much simpler code indeed. I see in your WIP series.

> that's still a win for me...

Unrelated question:
Should we add something about the git cache to 'Migrating from older Buildroot
versions'?
I am not sure because it does not really need any action from the user. It only
changes the behavior. For better in the long run.

An alternative is to reformat that e-mail that Thomas sent with a nice summary
of the feature and add it to 'Download infrastructure'.
If you don't find an easy way to add a user-friendly message in the rare case
the download infra cannot recover the cache (after your WIP series), the
message
     If you are not sure how to solve this, remove the git cache.
Could be added to this section of the manual.

>> In the case of someone always using tags from a linux repo, this person
>> would never need to download the full repo if the shallow fetch remains.
>> 
>> When someone wants just to try a package, for example, a debug tool, which
>> maybe will never be used again, this person would need to do a full clone,
>> instead of potentially do a shallow fetch.
>> 
>> The repo for some packages can be located on slow servers (not necessarily a
>> package in the tree, it can be on a br2-external).
>> 
>> And the least appealing argument: I was willing to recreate
>> http://patchwork.ozlabs.org/patch/702006/ on top of the new infra.
> 
> I'm still not convinced any more than I previously was. I.e. I still think
> we should go with full clone.

OK. If someone else brings a more convincing argument in the future we can
always re-add it covering all its corner cases.
I will change this patch to Rejected.

For my use case of sha1 from Gerrit, I will pursue different paths...
Maybe tuning the server side options to generate tarballs.
Maybe adding support to register download methods from a br2-external.

Regards,
Ricardo
