From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 8 Jan 2019 21:53:54 +0000 (UTC)
Subject: [Buildroot] popt build failing during autoreconf
References: <q132am$sni$1@blaine.gmane.org>
Message-ID: <q1365i$164$1@blaine.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-01-08, Grant Edwards <grant.b.edwards@gmail.com> wrote:

> The popt package has recently started failing to build during the
> autoreconf step. [...] This appears to be an incompatibility between
> automake and perl 5.26:
>
>   $ ./output/host/usr/bin/automake --version
>   Unescaped left brace in regex is illegal here in regex; marked by <-- HERE in m/\${ <-- HERE ([^ \t=:+{}]+)}/@./output/host/usr/bin/automake line 3936.
>
> It appears that buildroot-2016.11.2 is using automake 1.15, and the
> current git buildroot master branch is using version 1.15.1.  Should I
> be able to update the automake package without causing problems?

It is indeed an incompatiblity between automake 1.15 and perl 5.26.

Changing the automake version to 1.15.1 in the buildroot-2016.11.2
automake.mk file fixes the problem.  You can't, however, just use the
automake.mk file from git master, because the newer autotools host
paths are not what other packages expect.

-- 
Grant Edwards               grant.b.edwards        Yow! Here we are in America
                                  at               ... when do we collect
                              gmail.com            unemployment?
