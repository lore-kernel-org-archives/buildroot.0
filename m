From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Mar 2012 22:37:42 +0100
Subject: [Buildroot] [PATCH resend] Added lcdproc package
In-Reply-To: <CAHt8ZCP+vjdJ4AtHC8P=DXy+h2PBoHg8mfoFCQLx9bjyEmK0iw@mail.gmail.com>
 (Simon Dawson's message of "Thu, 15 Mar 2012 08:49:42 +0000")
References: <CAHt8ZCP+vjdJ4AtHC8P=DXy+h2PBoHg8mfoFCQLx9bjyEmK0iw@mail.gmail.com>
Message-ID: <87sjh9r1eh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Simon" == Simon Dawson <spdawson@gmail.com> writes:

 Simon> Signed-off-by: Simon Dawson <spdawson@gmail.com>

Committed with minor tweaks (see below) - Thanks.

 Simon> ---
 Simon>  package/Config.in                             |    1 +
 Simon>  package/lcdproc/Config.in                     |    7 +++++++
 Simon>  package/lcdproc/lcdproc-0.5.5-LCDd.conf.patch |   18 ++++++++++++++++++
 Simon>  package/lcdproc/lcdproc.mk                    |   14 ++++++++++++++
 Simon>  4 files changed, 40 insertions(+), 0 deletions(-)
 Simon>  create mode 100644 package/lcdproc/Config.in
 Simon>  create mode 100644 package/lcdproc/lcdproc-0.5.5-LCDd.conf.patch
 Simon>  create mode 100644 package/lcdproc/lcdproc.mk

 Simon> diff --git a/package/Config.in b/package/Config.in
 Simon> index 36a221c..2b78f93 100644
 Simon> --- a/package/Config.in
 Simon> +++ b/package/Config.in
 Simon> @@ -303,6 +303,7 @@ source "package/gtk2-engines/Config.in"
 Simon>  source "package/gtk2-themes/Config.in"
 Simon>  source "package/imlib2/Config.in"
 Simon>  source "package/jpeg/Config.in"
 Simon> +source "package/lcdproc/Config.in"

lcdproc is not really a library (E.G. no lib/headers), so I moved it
under 'Hardware handling' instead.


 Simon> +++ b/package/lcdproc/lcdproc.mk
 Simon> @@ -0,0 +1,14 @@
 Simon> +#############################################################
 Simon> +#
 Simon> +# lcdproc
 Simon> +#
 Simon> +#############################################################
 Simon> +LCDPROC_VERSION = 0.5.5
 Simon> +LCDPROC_SOURCE = lcdproc-$(LCDPROC_VERSION).tar.gz
 Simon> +LCDPROC_SITE =
 Simon> http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/lcdproc/

Your patch is word wrapped - Consider using git send-email in the
future. More importantly, it seems sf.net has changed something
recently, so this now gives me a 404. I have fixed it.

-- 
Bye, Peter Korsgaard
