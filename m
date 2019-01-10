From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 10 Jan 2019 21:56:42 +0100
Subject: [Buildroot] [PATCH 1/2] xenomai: remove unnecessary autoreconf
In-Reply-To: <875zuwsvvf.fsf@dell.be.48ers.dk>
References: <20190108203854.28015-1-patrickdepinguin@gmail.com>
 <20190109203332.GM4022@scaer> <87imyxrmk3.fsf@dell.be.48ers.dk>
 <CAAXf6LUTcDwSrhpnWo9N+d1APrjVP-KBAp1fX5z0DNaEBRdq5w@mail.gmail.com>
 <875zuwsvvf.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LWf7ss+BmUMcOewjbJDJTFMk_nUz1xtUuqoGMub8kzhjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El jue., 10 ene. 2019 a las 10:30, Peter Korsgaard
(<peter@korsgaard.com>) escribi?:
>
> >>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
>  >> Fixed, thanks. Odd that my check-package post-commit hook didn't catch
>  >> it.
>
>  > Oops, sorry.
>  > Could you show me how to enable this as hook, then I'll add it locally too.
>
> I have in .git/hooks/post-commit:
>
> #!/bin/sh
>
> # check-package on added/changed files
> git show --no-renames HEAD | \
>         lsdiff -s | \
>         awk '{ if ($1 != "-") print substr($2, 3) }' | \
>         xargs -r ./utils/check-package


Thanks!
