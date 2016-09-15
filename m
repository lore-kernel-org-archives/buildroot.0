From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Sep 2016 22:35:29 +0200
Subject: [Buildroot] [PATCH v3 4/4] docs/manual: add new section about
 the DEVELOPERS file and get-developer
In-Reply-To: <1473713695-2611-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1473713695-2611-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1473713695-2611-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1160156f-366c-fdd5-25f0-fa2c71305ab3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-09-16 22:54, Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  docs/manual/contribute.txt |  6 ++++++
>  docs/manual/developers.txt | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  docs/manual/manual.txt     |  2 ++
>  3 files changed, 54 insertions(+)
>  create mode 100644 docs/manual/developers.txt
> 
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> index 2973ef7..a8f9db7 100644
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -258,6 +258,12 @@ removed, preferably with the upstream commit ID. Also any other
>  required changes should be explained explicitly, like configure
>  options that no longer exist or are no longer needed.
>  
> +If you are interested in getting notified of build failures and of
> +further changes in the packages you added or modified, please add
> +yourself to the DEVELOPERS file. This should be done in a separate
> +patch of the series. See xref:DEVELOPERS[the DEVELOPERS file] for more
> +information.
> +
>  ==== Preparing a patch series
>  
>  Starting from the changes committed in your local git view, _rebase_
> diff --git a/docs/manual/developers.txt b/docs/manual/developers.txt
> new file mode 100644
> index 0000000..2fbbff3
> --- /dev/null
> +++ b/docs/manual/developers.txt
> @@ -0,0 +1,46 @@
> +// -*- mode:doc; -*-
> +// vim: set syntax=asciidoc:
> +
> +[[DEVELOPERS]]
> +== DEVELOPERS file and get-developers

 There should also be an xref to this section from the paragraph added in patch 3/4.

> +
> +The main Buildroot directory contains a file named +DEVELOPERS+ that
> +list the developers in charge of various areas of Buildroot. Thanks to
                       ^^^^^^^^^^^^ too strong. How about "involved in"?

> +this file, the +get-developer+ tool allows to:
> +
> +- Calculate the list of developers to whom patches should be sent, by
> +  parsing the patches and matching the modified files with the
> +  relevant developers. See xref:submitting-patches[] for details.
> +
> +- Find which developers are in charge of a given architecture or
                               ^^^^^^^^^ "taking care" ?


 Regards,
 Arnout

> +  package, so that they can be notified when a build failure occurs on
> +  this architecture or package. This is done in interaction with
> +  Buildroot's autobuild infrastructure.
> +
> +We ask developers adding new packages, new boards, or generally new
> +functionality in Buildroot, to register themselves in the +DEVELOPERS+
> +file. As an example, we expect a developer contributing a new package
> +to include in his patch the appropriate modification to the
> ++DEVELOPERS+ file.
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
