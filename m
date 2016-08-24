From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Aug 2016 02:21:44 +0200
Subject: [Buildroot] [PATCHv2/next 4/4] docs/manual: add new section
 about the DEVELOPERS file and get-developer
In-Reply-To: <1471956466-22338-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1471956466-22338-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471956466-22338-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <189a31d9-db1e-032c-8e79-d047b0ebed18@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23-08-16 14:47, Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  docs/manual/developers.txt | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  docs/manual/manual.txt     |  2 ++
>  2 files changed, 47 insertions(+)
>  create mode 100644 docs/manual/developers.txt
> 
> diff --git a/docs/manual/developers.txt b/docs/manual/developers.txt
> new file mode 100644
> index 0000000..e4c1d88
> --- /dev/null
> +++ b/docs/manual/developers.txt
> @@ -0,0 +1,45 @@
> +// -*- mode:doc; -*-
> +// vim: set syntax=asciidoc:
> +
> +== DEVELOPERS file and get-developers
> +
> +The main Buildroot directory contains a file named +DEVELOPERS+ that
> +list the developers in charge of various areas of Buildroot. Thanks to
> +this file, the +get-developer+ tool allows to:
> +
> +- Calculate the list of developers to whom patches should be sent, by
> +  parsing the patches and matching the modified files with the
> +  relevant developers. See xref:submitting-patches[] for details.
> +
> +- Find which developers are in charge of a given architecture or
> +  package, so that they can be notified when a build failure occurs on
> +  this architecture or package. This is done in interaction with
> +  Buildroot's autobuild infrastructure.
> +
> +We ask developers adding new packages, new boards, or generally new
> +functionality in Buildroot, to register themselves in the +DEVELOPERS+
> +file. As an example, we expect a developer contributing a new package
> +to include in his patch the appropriate modification to the
> ++DEVELOPERS+ file.

 As I hinted in my reply to patch 2, I would also add this message to the end of
the "The formatting of a patch" section in contribute.txt. Something like:

If you are interested in getting notified of build failures and of further
changes in the packages you modified, please add yourself to the DEVELOPERS
file. This should be done in a separate patch of the series. See
xref:DEVELOPERS[the DEVELOPERS file] for more information.

(and add [[DEVELOPERS]] to the developers section).


 Regards,
 Arnout


> +
> +The +DEVELOPERS+ file format is documented in detail inside the file
> +itself.
> +
> +The +get-developer+ tool, located in +support/scripts+ allows to use
> +the +DEVELOPERS+ file for various tasks:
> +
> +- When passing one or several patches as command line argument,
> +  +get-developer+ will return the appropriate +git send-email+
> +  command.
> +
> +- When using the +-a <arch>+ command line option, +get-developer+ will
> +  return the list of developers in charge of the given architecture.
> +
> +- When using the +-p <package>+ command line option, +get-developer+
> +  will return the list of developers in charge of the given package.
> +
> +- When using the +-c+ command line option, +get-developer+ will look
> +  at all files under version control in the Buildroot repository, and
> +  list the ones that are not handled by any developer. The purpose of
> +  this option is to help completing the +DEVELOPERS+ file.
> +
> diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
> index 3c531e3..7630ea6 100644
> --- a/docs/manual/manual.txt
> +++ b/docs/manual/manual.txt
> @@ -64,6 +64,8 @@ include::debugging-buildroot.txt[]
>  
>  include::contribute.txt[]
>  
> +include::developers.txt[]
> +
>  = Appendix
>  
>  include::appendix.txt[]
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
