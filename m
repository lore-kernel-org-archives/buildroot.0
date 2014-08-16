From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Aug 2014 09:35:47 +0200
Subject: [Buildroot] [PATCH 0 of 5 v4 for 2014.08] manual-text
 generation improvements
In-Reply-To: <patchbomb.1408110033@localhost>
References: <patchbomb.1408110033@localhost>
Message-ID: <20140816093547.666af315@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 15 Aug 2014 15:40:33 +0200, Thomas De Schampheleire wrote:

> Thomas De Schampheleire (5)
>   Makefile: unconditionally include pkg-utils.mk
>   gendoc infra: use $(pkgname) instead of explicitly passing 'manual'
>   gendoc infra: add support for asciidoc configuration files
>   manual-text: make sure URLs are displayed if a link text was provided
>   manual-text: hide image representations

Nice, you've added the list of patches to the cover letter :-)

I've applied the patch series, thanks to you, and to Yann and Samuel
for testing/reviewing.

Related to this patch series, here are a few things I noted:

 * When building the PDF and txt versions of the manual, I get one
   warning:

   a2x: WARNING: --destination-dir option is only applicable to HTML based outputs

   It seems to be harmless as the result is really located in the right
   place (output/docs), but I found it worth mentioning.

 * Also, here the PDF version of the manual doesn't build:

   a2x: ERROR: "dblatex" -t pdf -p "/etc/asciidoc/dblatex/asciidoc-dblatex.xsl" -s "/etc/asciidoc/dblatex/asciidoc-dblatex.sty" -P latex.output.revhistory=0  "/home/thomas/projets/buildroot/output/docs/manual/manual.xml" returned non-zero exit status 1

   It's most likely due to something missing or a wrong version in my
   installation, but it also means we're maybe not checking for all the
   necessary tools before generating the manual.

Both of those 'issues' are not introduced by your patch series, they
existed before it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
