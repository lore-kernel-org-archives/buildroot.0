From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 5 Dec 2013 06:39:19 -0600
Subject: [Buildroot] [PATCHv6 2/5] core: introduce the BR2_EXTERNAL
	variable
In-Reply-To: <1386198891-17968-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386198891-17968-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386198891-17968-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <OF07486542.AAD8DAA3-ON86257C38.00456953-86257C38.00458424@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas P,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 12/04/2013 
05:14:48 PM:

> This commit introduces the BR2_EXTERNAL environment variable, which
> will allow to keep Buildroot customization (board-specific
> configuration files or root filesystem overlays, package Config.in and
> makefiles, as well as defconfigs) outside of the Buildroot tree.
> 
> This commit only introduces the variable itself, and ensures that it
> is available within Config.in options. This allows us to use
> $BR2_EXTERNAL in a 'source' statement in Config.in.
> 
> Following patches extend the usage of BR2_EXTERNAL to other areas
> (packages and defconfigs).
> 
> In details, this commit:
> 
>  * Introduces the BR2_EXTERNAL Kconfig option. This option has no
>    prompt, and is therefore not visible to the user and also not
>    stored in the .config file. It is automatically set to the value of
>    the BR2_EXTERNAL environment variable. The only purpose of this
>    BR2_EXTERNAL Kconfig option is to allow $BR2_EXTERNAL to be
>    properly expanded when used inside Kconfig source statements.
> 
>  * Calculates the BR2_EXTERNAL value to use. If passed on the command
>    line, then this value is taken in priority, and saved to a
>    .br-external hidden file in the output directory. If not passed on
>    the command line, then we read the .br-external file from the
>    output directory. This allows the user to not pass the BR2_EXTERNAL
>    value at each make invocation. If no BR2_EXTERNAL value is passed,
>    we define it to support/dummy-external, so that the kconfig code
>    finds an existing $(BR2_EXTERNAL)/package/Config.in file to
>    include.
> 
>  * Passes the BR2_EXTERNAL into the *config environment, so that its
>    value is found when parsing/evaluating Config.in files and .config
>    values.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  Config.in             |  4 ++++
>  Makefile              | 26 +++++++++++++++++++++++++-
>  docs/manual/manual.mk |  3 +++
>  3 files changed, 32 insertions(+), 1 deletion(-)

Acked-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131205/58dcc03a/attachment.html>
