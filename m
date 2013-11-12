From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 13 Nov 2013 00:28:58 +0100
Subject: [Buildroot] [pull request v4] Pull request for branch
	yem/instrument-build
In-Reply-To: <cover.1384182040.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Mon, 11 Nov 2013 16:03:25 +0100")
References: <cover.1384182040.git.yann.morin.1998@free.fr>
Message-ID: <87habh2o91.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Hello All!

> This series adds support for instrumenting the build process, reworked
> after discussion both on the ML and during the developpers' day.

> It works as thus:
>   - we register a set of hooks
>   - hooks are called before and after each steps

> There are currently two hooks defined:
>   - log steps with timings (as an example of how to do a hook)
>   - call a user-supplied scripts

> More hooks can be added later on. Specifically, we may want to add a
> script (in support/scripts or wherever) that runs some verifications
> after packages are installed (in target/ and staging/), for example
> to check for RPATH, or to check scripts do not have build-dir paths
> in them (eg python scripts)...

> I'm planning on adding at least one other hook, that runs all scripts
> present in support/step-hooks/ (or whatever its name).

> Changes v3 -> v4:
>   - rename user-supplied hook  (Thomas DS)
>   - typoes  (Thomas DS)

> Changes v2 -> v3:
>   - rename the internal variable that holds the hooks  (Thomas DS)
>   - misc typo fixes  (Thomas DS)

> Changes v1 -> v2:
>   - removed the intra-steps instrumentation  (Thomas, Peter)
>   - accept a list of user-supplied hooks, not only one hook  (Thomas)

> Regards,
> Yann E. MORIN.

Committed series to next, thanks.

-- 
Bye, Peter Korsgaard
