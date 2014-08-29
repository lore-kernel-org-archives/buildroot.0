From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Aug 2014 19:24:43 +0200
Subject: [Buildroot] [PATCH v2 1/1] autobuilder: branch support
In-Reply-To: <1408625696-42975-1-git-send-email-Matthew.Weber@rockwellcollins.com>
References: <1408625696-42975-1-git-send-email-Matthew.Weber@rockwellcollins.com>
Message-ID: <20140829192443.0fb6c813@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Thu, 21 Aug 2014 07:54:56 -0500, Matt Weber wrote:
> Adds an option to specify a specific branch for the autobuilder
> to execute against (Defaults to the master branch).
> 
> Signed-off-by: Matt Weber <Matthew.Weber@rockwellcollins.com>
> ---
> 
> Changes v1 -> v2
>  - Fixed assignment of br_branch value to variable
>    when reading config from file. (Suggested by Clayton S)

What is the intended usage of this? Because customizing the branch
without being able to customize the Git repository from which we're
getting the Buildroot sources seems a bit odd. Or is it just to test
the 'next' branch?

Also, there's the issue of the build results being submitted on
autobuild.buildroot.org: on this site, for now, we don't have any
concept of "branch" or multiple versions being tested. We simply assume
that the only thing we're testing is the master branch, and that this
branch is evolving progressively over time. If the autobuild-run script
then grows the capability of testing other branches/repositories than
just the master branch of the official Buildroot repository, it raises
the question of what happens when those build results are submitted to
autobuild.buildroot.org.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
