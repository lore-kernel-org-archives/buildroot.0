From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 17 Feb 2019 23:46:37 -0300
Subject: [Buildroot] [PATCH v5 09/10] testing/tests/download: test git
 special ref
References: <cf2f9717-48a8-8616-b8ec-3d30bfbd9ab1@mind.be>
Message-ID: <5c6a1c8d830d8_778d3fe400187698100087@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Feb 06, 2019 at 08:05 AM, Arnout Vandecappelle wrote:

> On 12/05/2018 04:58, Ricardo Martincoski wrote:
>> From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
>> 
>> Add a special ref to the static repo and check on the git refs test case
>> the download of a git package:
>>  - with the name of a special ref as version;
> 
>  We might remove support for getting special refs by name, but keep on
> supporting getting special refs by sha1. So I've changed the test into getting
> it by sha1 instead.

OK... but it depends on a recent git version to work.
The same does not occur when getting special refs by name.

When using recent versions of git the download of the sha1 of a special ref
works because of this line in support/download/git:
  _git fetch origin "'${cset}:${cset}'"
I tested using:
git version 2.17.1

The git version installed in our docker image does not support it.

I am not sure what is the best fix for the TestGitRefs failure in GitLab CI.
I would change the test to use special ref by name, and *when* we change the
behavior, we change the test in the same commit to expect it to fail.

> 
>  Ideally there should also be a check for getting the parent of the special ref
> by sha1, but I think that actually does *not* work now.

I expect it to not work. But I didn't tested recently.

Regards,
Ricardo
