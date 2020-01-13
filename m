From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 Jan 2020 16:33:07 +0100
Subject: [Buildroot] [PATCH 1/2] libmodescurity: new package
In-Reply-To: <87d0brmj8i.fsf@dell.be.48ers.dk>
References: <20200110140017.15045-1-frank.vanbever@essensium.com>
 <87d0brmj8i.fsf@dell.be.48ers.dk>
Message-ID: <a94f6405-b567-cc14-a114-812bbdf0b977@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/01/2020 16:19, Peter Korsgaard wrote:
>  > diff --git a/package/libmodsecurity/0001-Fail-when-CANONICAL_HOST-cannot-be-determined.patch b/package/libmodsecurity/0001-Fail-when-CANONICAL_HOST-cannot-be-determined.patch
>  > new file mode 100644
>  > index 0000000000..d725d136ff
>  > --- /dev/null
>  > +++ b/package/libmodsecurity/0001-Fail-when-CANONICAL_HOST-cannot-be-determined.patch
>  > @@ -0,0 +1,31 @@
>  > +From 0832208360aab69fbaec76225db67801840a33fe Mon Sep 17 00:00:00 2001
>  > +From: Frank Vanbever <frank.vanbever@essensium.com>
>  > +Date: Fri, 10 Jan 2020 11:14:43 +0100
>  > +Subject: [PATCH] Fail when CANONICAL_HOST cannot be determined
>  > +
>  > +When the CANONICAL_HOST is unknown the configure script exits
>  > +with exit code 0 even though no makefile was produced.
>  > +
>  > +patch was submitted upstream: https://github.com/SpiderLabs/ModSecurity/pull/2235
>  > +
>  > +Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
>  > +---
>  > + configure.ac | 2 +-
>  > + 1 file changed, 1 insertion(+), 1 deletion(-)
>  > +
>  > +diff --git a/configure.ac b/configure.ac
>  > +index 95e48843..5e6971f4 100644
>  > +--- a/configure.ac
>  > ++++ b/configure.ac
>  > +@@ -193,7 +193,7 @@ case $host in
>  > +     ;;
>  > +        *)
>  > +     echo "Unknown CANONICAL_HOST $host"
>  > +-    exit
>  > ++    exit 1
> 
> What is the use of this patch in Buildroot? I mean, it looks correct but
> we should ensure the configure script can correctly detect
> CANONICAL_HOST (whatever that is), so this should never trigger?

 Without this patch, if there is some platform for which CANONICAL_HOST does not
get set correctly, you get a very cryptic error instead of a failure of the
configure step. So hopefully this patch isn't needed, but if it is actually
needed because CANONICAL_HOST is still not correct, it helps us a lot.

 In other words, I would keep it in Buildroot.

 Regards,
 Arnout
