From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Feb 2014 16:58:26 +0100
Subject: [Buildroot] [pkg-perl infra V4 4/9] host-perl-xml-parser:
 rename and refactor with perl infrastructure
In-Reply-To: <1391608380-23240-5-git-send-email-francois.perrad@gadz.org>
References: <1391608380-23240-1-git-send-email-francois.perrad@gadz.org>
 <1391608380-23240-5-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140205165826.69eacd79@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Wed,  5 Feb 2014 14:52:55 +0100, Francois Perrad wrote:
> note: only the host variant is used

It would be good to have much more verbose commit logs. Something such
as:

"""
Even though libxml-parser-perl had a Config.in file with an option to
enable it on the target, this option was hidden by a dependency on
BR2_HOST_ONLY. So in practice, it was not possible to enable
libxml-parser-perl on the target. This allows us to rename
libxml-parser-perl to perl-xml-parser to follow the new naming
convention of Perl packages, without having to introduce
Config.in.legacy material.

In addition to this rename, the package is converted to use the newly
introduced Perl package infrastructure.

"""

> +HOST_LIBXML_PARSER_PERL_CONF_OPT += EXPATLIBPATH=$(HOST_DIR)/usr/lib
> +HOST_LIBXML_PARSER_PERL_CONF_OPT += EXPATINCPATH=$(HOST_DIR)/usr/include

We normally do:

HOST_LIBXML_PARSER_PERL_CONF_OPT = \
	EXPATLIBPATH=$(HOST_DIR)/usr/lib \
	EXPATINCPATH=$(HOST_DIR)/usr/include

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
