From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Nov 2019 09:09:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysrepo: fix host/staging
 install steps
In-Reply-To: <CAEyMn7bdb24JJnVQMa+Tr_uBQU3vHEdcnj6vxEMewr3oADXfrA@mail.gmail.com>
References: <20191103060113.4884-1-heiko.thiery@gmail.com>
 <20191104223848.5e67d301@windsurf.home>
 <CAEyMn7bdb24JJnVQMa+Tr_uBQU3vHEdcnj6vxEMewr3oADXfrA@mail.gmail.com>
Message-ID: <20191105090931.5b8953c9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 5 Nov 2019 09:03:27 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> The problem comes from the hardcoded TARGET_DIR that is compiled-in the
> needed host tools (sysrepocfg, sysrepoctl) in the build host step.
> This value is used
> as target for this tools as well as search path for other dependencies.
> With this all install steps tries to install parts into that
> TARGET_DIR. I think it is not
> really clean that this happens. When I just do the part hat only the
> tools are build in
> the host step. Then the staging will fail because there are missing
> files that are
> expected to be located in the TARGET_DIR. The tools have the hardcoded search
> path set to the TARGET_DIR.

Hum, OK. Did you talk about this with the upstream project ?

Your proposed solution is probably good as a workaround, but long term
it would be nice to have the upstream sysrepo project support better
cross-compilation, by solving those paths issues.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
