From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 Dec 2010 23:47:25 +0100
Subject: [Buildroot] [PATCH 1/1] ccache: rework ccache management
In-Reply-To: <03b95520ec943581129be4cf92a6ea70e661cf6d.1291403746.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Fri, 3 Dec 2010 20:16:23 +0100")
References: <cover.1291403746.git.thomas.petazzoni@free-electrons.com>
	<cover.1291403746.git.thomas.petazzoni@free-electrons.com>
	<03b95520ec943581129be4cf92a6ea70e661cf6d.1291403746.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87zksjvnuq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas>  * ccache is now a normal package (both for the host and the target).

Besides the general comments, I have a few specific ones as well:

 Thomas> +++ b/docs/buildroot.html
 Thomas> @@ -681,6 +682,31 @@ endif
 Thomas>      Build options -&gt; Toolchain and header file location</code> options.
 Thomas>      This could be useful if the toolchain must be shared with other users.</p>
 
 Thomas> +    <h2 id="ccache-support">Using <code>ccache</code> in Buildroot</h2>
 Thomas> +
 Thomas> +    <p><a href="http://ccache.samba.org">ccache</a> is a compiler
 Thomas> +    cache. It stores the object files resulting from each compilation
 Thomas> +    process, and is able to skip future compilation of the same source
 Thomas> +    file (with same compiler and same arguments) by using the
 Thomas> +    pre-existing object files. When doing almost identical builds from
 Thomas> +    scratch a number of times, it can divide the build time by a
 Thomas> +    factor of two.</p>

The improvement depends quite a lot on the configuration / use case, so
I think we should simpluy write something like 'it can significantly
speed up the build process.' rather than specifically saying x2.

 Thomas> +++ b/package/ccache/Config.in
 Thomas> @@ -0,0 +1,5 @@
 Thomas> +config BR2_PACKAGE_CCACHE
 Thomas> +	bool "ccache"
 Thomas> +	help
 Thomas> +	  Compiler Cache
 Thomas> +	  http://samba.org/ftp/ccache
 Thomas> \ No newline at end of file

You forgot the missing newline here and for the .mk. We normally have an
empty line before the website. The official website is afaik also
http://ccache.samba.org, rather than this download URL.

Doesn't ccache need zlib?

-- 
Bye, Peter Korsgaard
