From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Nov 2017 16:00:31 +0100
Subject: [Buildroot] [PATCH 1/1] .gitlab-ci.yml: use gitlab 9.0 varaible
 names
In-Reply-To: <20171023142614.11522-1-thomas.preston@codethink.co.uk>
References: <20171023142614.11522-1-thomas.preston@codethink.co.uk>
Message-ID: <23b2b26d-93fe-9bbc-9f71-111cf762926f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-10-17 16:26, Thomas Preston wrote:
> Gitlab 9.0 prefers "job" instead of "build" for CI variables names.
> http://docs.gitlab.com/ce/ci/variables/README.html#9-0-renaming
> 
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>

 Applied to master, thanks. Good catch! Did you see a warning somewhere or did
it come naturally after looking at the file?

 Regards,
 Arnout

> ---
>  .gitlab-ci.yml    | 4 ++--
>  .gitlab-ci.yml.in | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index ebaac7a3d9..0dddb22f12 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -8,7 +8,7 @@ image: buildroot/base
>  
>  .defconfig_script: &defconfig_script
>      - echo 'Configure Buildroot'
> -    - make ${CI_BUILD_NAME}
> +    - make ${CI_JOB_NAME}
>      - echo 'Build buildroot'
>      - |
>          make > >(tee build.log |grep '>>>') 2>&1 || {
> @@ -51,7 +51,7 @@ check-DEVELOPERS:
>      # runner will clean up those files for us.
>      # Multiply every emulator timeout by 10 to avoid sporadic failures in
>      # elastic runners.
> -    script: ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${CI_BUILD_NAME}
> +    script: ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${CI_JOB_NAME}
>      artifacts:
>          when: always
>          expire_in: 2 weeks
> diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
> index 3abf7d5313..33c7b13725 100644
> --- a/.gitlab-ci.yml.in
> +++ b/.gitlab-ci.yml.in
> @@ -8,7 +8,7 @@ image: buildroot/base
>  
>  .defconfig_script: &defconfig_script
>      - echo 'Configure Buildroot'
> -    - make ${CI_BUILD_NAME}
> +    - make ${CI_JOB_NAME}
>      - echo 'Build buildroot'
>      - |
>          make > >(tee build.log |grep '>>>') 2>&1 || {
> @@ -51,7 +51,7 @@ check-DEVELOPERS:
>      # runner will clean up those files for us.
>      # Multiply every emulator timeout by 10 to avoid sporadic failures in
>      # elastic runners.
> -    script: ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${CI_BUILD_NAME}
> +    script: ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${CI_JOB_NAME}
>      artifacts:
>          when: always
>          expire_in: 2 weeks
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
