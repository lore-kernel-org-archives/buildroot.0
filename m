From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 9 Oct 2013 22:10:41 +0200
Subject: [Buildroot] [PATCH v3 1/1] manual: update review process and
	patchwork
In-Reply-To: <1381340833-29259-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1381340833-29259-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <CAAXf6LUOxhBHwLMyRE-iFzVCyozn-MS5LGuk3VknpLgS5kwZpw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,

Now that I can earn points, your patch has got my full attention ;)
Below a few minor points that I didn't spot the first time.

On Wed, Oct 9, 2013 at 7:47 PM, Ryan Barnett
<rjbarnet@rockwellcollins.com> wrote:
> Adding more documentaiton based on discussion from the mailing list
> in regards the buildroot review process and how patchworks can be
> used to pull in patches for testing purposes.
>
> Mailing list discussion:
> http://lists.busybox.net/pipermail/buildroot/2013-September/078170.html
>
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
>
> ---
>
> v2 -> v3
>  * Changed 'a' to 'an' when preceeding +mbox+ (suggested by Thomas
>    De Schampheleire)
>
> v1 -> v2
>  * Updated all references to patchwork to be Patchwork or Buildroot's
>    Patchwork instead of a few misspellings (suggested by Thomas
>    Petazzoni)
>  * Added clarification that patchwork main use is for the Buildroot
>    maintainer (suggested by Thomas Petazzoni)
>
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> ---
>  docs/manual/contribute.txt   |   12 +++++++++++-
>  docs/manual/get-involved.txt |   38 +++++++++++++++++++++++++++++++++++---
>  2 files changed, 46 insertions(+), 4 deletions(-)
>
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> index 2b2783d..201685c 100644
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -132,9 +132,15 @@ $ git format-patch --subject-prefix "PATCH v4" \
>  Reviewing/Testing patches
>  -------------------------
>
> +The review process for new patches is done over the mailing list. Once
> +a patch is submitted to the mailing list, other developers will provide
> +feedback to the patch via emails sent through the mailing list.
> +
>  In the review process, do not hesitate to respond to patch submissions
>  for remarks, suggestions or anything that will help everyone to
> -understand the patches and make them better.
> +understand the patches and make them better. Please use internet
> +style replies in plain text emails when responding to patch
> +submissions.
>
>  Some tags are used to help following the state of any patch posted on
>  the mailing-list:
> @@ -144,6 +150,10 @@ Acked-by:: Indicates that the patch can be committed.
>  Tested-by:: Indicates that the patch has been tested. It is useful
>    but not necessary to add a comment about what has been tested.
>
> +Buildroot's Patchwork website can be used to pull in patches for testing
> +purposes. Please see xref:apply-patches-patchwork[] for more
> +information on using Buildroot's Patchwork website to apply patches.
> +
>  Autobuild
>  ---------
>
> diff --git a/docs/manual/get-involved.txt b/docs/manual/get-involved.txt
> index 8515d34..aa319e2 100644
> --- a/docs/manual/get-involved.txt
> +++ b/docs/manual/get-involved.txt
> @@ -55,11 +55,43 @@ using a code sharing website.
>  Patchwork
>  ---------
>
> -The Buildroot patch management interface is at
> +Patchwork is a web-based patch tracking system designed to facilitate
> +the contribution and management of contributions to an open-source
> +project. Patches that have been sent to a mailing list are \'caught' by
> +the system, and appear on a web page. Any comments posted that
> +reference the patch are appended to the patch page too. For more
> +information on Patchwork see
> +http://jk.ozlabs.org/projects/patchwork[].
> +
> +Buildroot's Patchwork website is mainly for use by the Buildroot's
> +maintainer to ensure patches aren't missed. The website however,

"the Buildroot's maintainer" should either be "the Buildroot
maintainer" or "Buildroot's maintainer".

> +exposes patches and their corresponding review comments in a clean
> +and concise web interface.
> +
> +The Buildroot patch management interface is available at
>  http://patchwork.buildroot.org[].
>
> -All patches and comments sent through the mailing list are
> -automatically indexed in http://patchwork.buildroot.org[patchwork].
> +[[apply-patches-patchwork]]
> +Applying Patches from Patchwork
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Buildroot's Patchwork website main use for a developer is for pulling

To be correct this should be:
Buildroot's Patchwork website's main use...
but it may be lighter to write:
The main use of Buildroot's Patchwork website for a developer...

> +in patches into their local git repository for testing purposes.
> +
> +When browsing patches in the patchwork management interface, an +mbox+
> +link is provided at the top of the page. Copy this link address and
> +run the following commands:
> +
> +---------------------
> +$ git checkout -b <test-branch-name>
> +$ wget -O - <mbox-url> | git am
> +---------------------
> +
> +Another option for applying patches is to create a bundle. A bundle is
> +a set of patches that you can group together using the patchwork
> +interface. Once the bundle is created and the bundle is made public,
> +you can copy the +mbox+ link for the bundle and apply the bundle
> +using the above commands.
>
>  [[bugtracker]]
>  Bugtracker

Best regards,
Thomas
