From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Sep 2019 23:52:30 +0200
Subject: [Buildroot] buildroot | Pipeline #82808101 has failed for
 master | b81e00e2
In-Reply-To: <5d814e4ae504a_72913fc881ffe46414816e@sidekiq-besteffort-05-sv-gprd.mail>
References: <5d814e4ae504a_72913fc881ffe46414816e@sidekiq-besteffort-05-sv-gprd.mail>
Message-ID: <37f880aa-270c-73a2-79ce-9468c4181625@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Adam,

On 17/09/2019 23:21, GitLab wrote:
> GitLab
> ? 	Your pipeline has failed.
[snip]
> Pipeline #82808101
> <https://gitlab.com/buildroot.org/buildroot/pipelines/82808101> triggered by 	
> arnout <https://gitlab.com/arnout>
> 
> had 1 failed build.
> Logs may contain sensitive data. Please consider before forwarding this email.
> ? 	test
> 
> 	check-package <https://gitlab.com/buildroot.org/buildroot/-/jobs/297684196>
> 
> 0 warnings generated
> 45840 lines processed
> 1 warnings generated
> package/libglib2/libglib2.mk:90: consecutive empty lines

 Could you fix this check-package warning?


 Thomas, could you add the following to your .git/hooks/post-applypatch ?

# check-package on added/changed files
git show HEAD | \
        lsdiff -s | \
        awk '{ if ($1 != "-") print substr($2, 3) }' | \
        xargs -r check-package -q


 Regards,
 Arnout


> 45331 lines processed
> 0 warnings generated
> Makefile:1191: recipe for target 'check-package' failed
> make: *** [check-package] Error 1
> ERROR: Job failed: exit code 1
> 
> GitLab
> You're receiving this email because of your account on gitlab.com. Manage all
> notifications <https://gitlab.com/profile/notifications> ? Help
> <https://gitlab.com/help>
> 
