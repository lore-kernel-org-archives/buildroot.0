From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 23 Oct 2017 00:38:57 -0200
Subject: [Buildroot] [next v2 6/7] testing/tests/download: add test for
 sha1 as git ref
References: <a0cb8592-2d28-58ca-cbf7-f5bec4cc2985@mind.be>
Message-ID: <59ed56417df8a_5e463fc3acb4bba81935e@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Oct 06, 2017 at 06:57 PM, Arnout Vandecappelle wrote:

> On 27-08-17 00:20, Ricardo Martincoski wrote:
>> From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
>> 
>> Add a test to download the package with git method and its version set
>> to a sha1 reachable by a branch name, but not pointed by it.
>> This is the most common use case for git refs in the tree.
>> 
>> Besides the test case Python script, add:
>>  - a br2-external (git-refs) with a fake package (foo) as a fixture for
>>    this and upcoming tests;
> 
>  I'd use a more descriptive name than foo, e.g. git-refs.mk

OK. In order to use a static repo I will create one package for each ref type to
check so I can have hashes for each tarball so I don't need to manually open the
tarball to know it is OK. But I will keep the tip for "more descriptive name" in
mind while creating the packages.

> 
>>  - support in GitTestBase for repos created on the fly;
>>  - a new class GitRepo to create and manipulate repos. It is a class and
>>    not a simple module because it will become very useful when testing
>>    submodules.
> 
>  So why do you suddenly need to create repos on the fly now? I still believe it
> is much simpler to include the repo directly. I also think it's easier if the
> same repo is used for all git tests - which should be possible, I think.

Fair enough. I will switch to a single static repo in the next spin.

Regards,
Ricardo
