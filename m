From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 20:59:30 +0200
Subject: [Buildroot] [PATCH] support/scripts: rework generation of
 pipelines
In-Reply-To: <20201005204825.196413-1-yann.morin.1998@free.fr>
References: <20201005204825.196413-1-yann.morin.1998@free.fr>
Message-ID: <20201006205930.4cb6c25a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  5 Oct 2020 22:48:25 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Note: triggering a pipeline can be done with a simple curl invocation:
> 
>     $ curl -X POST \
>         -F "token=${YOUR_TOKEN}" \
>         -F "ref=${BRANCH_TO_TEST}" \
>         -F "variables[BR_SCHEDULE_JOBS]=${TEST_TO_RUN}" \
>         "https://gitlab.com/api/v4/projects/${YOU_PROJEXT_ID}/trigger/pipeline"

s/YOU_PROJEXT_ID/YOUR_PROJECT_ID/

> +          (*-tests.*)
> +            tests=( "${CI_COMMIT_REF_NAME##*-}" )

Should have been:

		runtimes= ...

I have applied after fixing that. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
