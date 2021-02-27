From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 18:57:27 +0100
Subject: [Buildroot] [PATCH] package/python-django: security bump to
 version 3.0.13
In-Reply-To: <20210219095942.20995-1-peter@korsgaard.com>
References: <20210219095942.20995-1-peter@korsgaard.com>
Message-ID: <CACXmVibKMdThYvb95wWq_F929ZGL9oUP_zF+tJmau5juHo4ajg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 19, 2021 at 10:59 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> Fixes the following security issue:
>
> - CVE-2021-23336: Web cache poisoning via django.utils.http.limited_parse_qsl()
>
>   Django contains a copy of urllib.parse.parse_qsl() which was added to
>   backport some security fixes.  A further security fix has been issued
>   recently such that parse_qsl() no longer allows using ; as a query
>   parameter separator by default.  Django now includes this fix.  See
>   bpo-42967 for further details.
>
> For more details, see the advisory:
> https://www.djangoproject.com/weblog/2021/feb/19/security-releases/
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
