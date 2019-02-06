From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 6 Feb 2019 11:59:50 +0100
Subject: [Buildroot] [PATCH v3 2/5] .gitlab-ci.yml: use "include" keyword
In-Reply-To: <20190121011115.19255-3-ricardo.martincoski@gmail.com>
References: <20190121011115.19255-1-ricardo.martincoski@gmail.com>
 <20190121011115.19255-3-ricardo.martincoski@gmail.com>
Message-ID: <1a09bb90-2a61-4db6-d4cd-e1972c955675@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/01/2019 02:11, Ricardo Martincoski wrote:
> Do not copy the contents of .gitlab-ci.yml.in to .gitlab-ci.yml when
> 'make .gitlab-ci.yml' runs, use the new "include" keyword instead.
> 
> The docs state "include requires the external YAML file to have the
> extensions .yml or .yaml" so rename .gitlab-ci.yml.in. Use the example
> name from the docs: .gitlab-ci-template.yml.
> This file is not anymore a template for our own script that generates
> .gitlab-ci.yml. It becomes a job template to the Gitlab CI infra
> to use when populating the list of jobs to run.

 Meh, this is not what I meant...

 What I meant was to rename .gitlab-ci.yml.in to .gitlab-ci.yml and to add the
include to the end of it, and to make generate-gitlab-ci.yml generate only the
included file.

 This has the advantage that it allows to generate different versions of the
included file by modifying the generator script. For example, we could think of
generating only a subset of the defconfigs and tests in master, and use a
special branch for full testing, and add another CI job with a time trigger that
updates that special branch.


 I thought of fixing that up while committing, but it's a little bit complicated
so instead I've marked the rest of the series as Changes Requested.

 If you don't have time to do it, could you instead repost v2 but rebased on the
"extends" patch?

 Regards,
 Arnout
