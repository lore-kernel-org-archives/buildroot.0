From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2015 22:36:57 +0100
Subject: [Buildroot] [PATCH 0/5] Introduce alternative archive format
In-Reply-To: <1447929366-8972-1-git-send-email-jezz@sysmic.org>
References: <1447929366-8972-1-git-send-email-jezz@sysmic.org>
Message-ID: <20151229213657.GH3445@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J??me, All,

On 2015-11-19 11:36 +0100, J?r?me Pouiller spake thusly:
> As suggested by Arnout [1], this series provide an alternative archive
> format. This new format contains a shallowed version of upstream
> repository. This format is a little bigger and a little longer to
> create but it allow a better workflow with upstream. I describe some
> good practice in patch 2.
> 
> Notice projects hosted by github don't yet benefit of this feature
> since I have not found any elegant way to do it :-(. 
> 
> During my tests, I have noticed current shallow clone is mostly broken
> (at least with git < 2.5 [2]). Indeed, shallow clone only work with
> symbolic references (HEAD, a tag or a branch). However, we avoid use of
> symbolic references in VERSION.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2015-November/144296.html
> [2] http://stackoverflow.com/a/30701724/301717
> 
> 
> J?r?me Pouiller (5):
>   pkg-download: do not test SITE_METHOD
>   download/git: allow to create archives containing shallowed git repos
>   pkg-generic: allow to populate build directory from a git archive
>   pkg-generic: provide an option to use git archives
>   pkg-generic: tag sources if git is used

Thanks for the proposal. :-)

Following the previous replies from Thomas and I, we've further
discussed this tonight on IRC, and we still believe this is not how
development (active or debugging) should be done, and we already provide
the _OVERRIDE_SRCDIR for that.

As such, I've marked patches 2..5 of your series as rejected in
Patchwork.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
