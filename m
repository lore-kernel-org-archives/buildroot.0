From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Mar 2012 10:15:06 +0200
Subject: [Buildroot] [PATCH] libxml-parser-perl: Pass USE_MM_LD_RUN_PATH
	to MakeMaker.
In-Reply-To: <CAFbHwiS6diQ_fskroM0bDEqHgxCvy2w3jP2-s7o1RcrK9mzhcA@mail.gmail.com>
 (Will Newton's message of "Fri, 30 Mar 2012 09:04:52 +0100")
References: <CAFbHwiS6diQ_fskroM0bDEqHgxCvy2w3jP2-s7o1RcrK9mzhcA@mail.gmail.com>
Message-ID: <87k422ec8l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

Hi,

 Will> Red Hat versions of perl do not honour the setting of LD_RUN_PATH
 Will> without this option. This leads to perl shared objects being installed
 Will> without an rpath set which causes problems for target tools when
 Will> searching for dependant shared libraries.

 Will> Signed-off-by: Will Newton <will.newton@imgtec.com>
 Will> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Will> ---
 Will>  package/libxml-parser-perl/libxml-parser-perl.mk |    1 +
 Will>  1 files changed, 1 insertions(+), 0 deletions(-)

 Will> diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk
 Will> b/package/libxml-parser-perl/libxml-parser-perl.mk
 Will> index 9e6f2ec..70d0918 100644
 Will> --- a/package/libxml-parser-perl/libxml-parser-perl.mk
 Will> +++ b/package/libxml-parser-perl/libxml-parser-perl.mk
 Will> @@ -18,6 +18,7 @@ define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
 Will>          INSTALLDIRS=site \
 Will>          INSTALLSITELIB=$(HOST_DIR)/usr/lib/perl \
 Will>          INSTALLSITEARCH=$(HOST_DIR)/usr/lib/perl \
 Will> +	USE_MM_LD_RUN_PATH=1 \

Indentation is wrong (spaces vs tabs), but I fixed that and committed,
thanks.

-- 
Bye, Peter Korsgaard
