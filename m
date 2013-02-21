From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Feb 2013 21:53:40 +0100
Subject: [Buildroot] [PATCH 12/13] tinyxml: new package
In-Reply-To: <ad24f17c066c0f28873e76aaf0f69b08ca205e36.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
 <ad24f17c066c0f28873e76aaf0f69b08ca205e36.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <201302212153.41241.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

Sorry, I forgot something in the previous review...

On Thursday 21 February 2013 Maxime Hadjinlian wrote:
[--SNIP--]
> diff --git a/package/tinyxml/tinyxml.mk b/package/tinyxml/tinyxml.mk
> new file mode 100644
> index 0000000..f4f042b
> --- /dev/null
> +++ b/package/tinyxml/tinyxml.mk
> @@ -0,0 +1,12 @@
> +#############################################################
> +#
> +# tinyxml
> +#
> +#############################################################
> +
> +TINYXML_VERSION = 2.6.2_2
> +TINYXML_SITE = http://mirrors.xbmc.org/build-deps/sources
> +TINYXML_AUTORECONF = YES

Explain why it needs autoreconf.

As you point the help text to the git repository, I looked there, and
there is *no* configure.{ac,in}.

But looking at the download URL, I downloaded the tarball, and it seems
the XBMC folks have added a configure.ac in their distribution of tinyxml2.

But looking even more closely, it seems XBMC is using tinyxml, and *not*
tinyxml2. Specifically, they are using tinyxml 2.6.2, originally available
there (not to say that's the one we should use):
    http://sourceforge.net/projects/tinyxml/

So, Id 'update the help text to refer to tinyxml, not tinyxml2.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
