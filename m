From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 08 Apr 2019 00:22:11 -0300
Subject: [Buildroot] [PATCH v3 2/5] .gitlab-ci.yml: use "include" keyword
References: <1a09bb90-2a61-4db6-d4cd-e1972c955675@mind.be>
Message-ID: <5caabe634b731_25943ff6aa17fcc43877a@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Sorry for the long delay in answering.

On Wed, Feb 06, 2019 at 08:59 AM, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 21/01/2019 02:11, Ricardo Martincoski wrote:
>> Do not copy the contents of .gitlab-ci.yml.in to .gitlab-ci.yml when
>> 'make .gitlab-ci.yml' runs, use the new "include" keyword instead.
>> 
>> The docs state "include requires the external YAML file to have the
>> extensions .yml or .yaml" so rename .gitlab-ci.yml.in. Use the example
>> name from the docs: .gitlab-ci-template.yml.
>> This file is not anymore a template for our own script that generates
>> .gitlab-ci.yml. It becomes a job template to the Gitlab CI infra
>> to use when populating the list of jobs to run.
> 
>  Meh, this is not what I meant...

Oh, really sorry. I was thinking only about the duplicated code.

> 
>  What I meant was to rename .gitlab-ci.yml.in to .gitlab-ci.yml and to add the
> include to the end of it, and to make generate-gitlab-ci.yml generate only the
> included file.

OK

> 
>  This has the advantage that it allows to generate different versions of the
> included file by modifying the generator script. For example, we could think of
> generating only a subset of the defconfigs and tests in master, and use a
> special branch for full testing, and add another CI job with a time trigger that
> updates that special branch.

OK, now (hopefully) I see what you want to achieve.

>  I thought of fixing that up while committing, but it's a little bit complicated
> so instead I've marked the rest of the series as Changes Requested.
> 
>  If you don't have time to do it, could you instead repost v2 but rebased on the
> "extends" patch?

I will repost without this patch so we can move forward with this series.
But we can revisit the use of 'include' later, after the series got merged.


Regards,
Ricardo
