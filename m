From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 21:31:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/libgeos: depends on wchar
In-Reply-To: <20210131194722.4032192-1-fontaine.fabrice@gmail.com>
References: <20210131194722.4032192-1-fontaine.fabrice@gmail.com>
Message-ID: <20210131213114.26f46038@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sun, 31 Jan 2021 20:47:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libgeos unconditionally uses wstring which raises the following build
> failure:
> 
> In file included from /srv/storage/autobuild/run/instance-3/output-1/build/libgeos-3.9.0/tools/astyle/ASLocalizer.cpp:40:
> /srv/storage/autobuild/run/instance-3/output-1/build/libgeos-3.9.0/tools/astyle/ASLocalizer.h:72:34: error: 'wstring' does not name a type; did you mean 'stdin'?
>   string convertToMultiByte(const wstring& wideStr) const;
>                                   ^~~~~~~
>                                   stdin
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e97d03848d9bbf1845b994f391679a1dbf49f61e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libgeos/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks. However, as usual it would be good to
provide more details about since when the problem occurs. Is it since
the package has been introduced ? Since a version bump ?

Of course, in this case, the package has been recently introduced so
you can say "it's trivial". But it means that the maintainer reviewing
your patch has to look this up, and once again Peter will have to look
it up when he looks at your commit and considers it for the LTS/stable
branches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
