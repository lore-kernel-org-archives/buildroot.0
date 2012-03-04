From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 4 Mar 2012 21:54:05 +0100
Subject: [Buildroot] [PATCHv3] qt: Add option to build and install tools
	on the target
In-Reply-To: <1330887941-29437-1-git-send-email-ismael.luceno@gmail.com>
References: <1330887941-29437-1-git-send-email-ismael.luceno@gmail.com>
Message-ID: <201203042154.05630.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 04 March 2012 20:05:41 Ismael Luceno wrote:
> 
> Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>

 If you make several versions of a patch it's useful to have a changelog
that specifies what you changed compared to the previous version.

> +menuconfig BR2_PACKAGE_QT_TOOLS
> +	bool "Compile and install tools"
> +	depends on BR2_PACKAGE_QT_SQL_MODULE && BR2_PACKAGE_QT_GUI_MODULE
> +	help
> +	  SQL module is nedded to build, but only required at run-time by a
> +	  few tools (assistant, designer, qmlviewer).

 nedded -> needed

 This help text doesn't make much sense here; I meant as part of the
"Tools need the SQL and GUI modules" comment.  But actually there it
also doesn't make sense because nobody looks at the help text of a
comment.

 So maybe just leave it as a #-comment.

[snip]

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
