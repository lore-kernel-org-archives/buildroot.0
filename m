From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 14:00:22 +0100
Subject: [Buildroot] [PATCH 22/22] dependencies: check that SSL
	certificates are installed
In-Reply-To: <1364113606-20836-23-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 24 Mar 2013 09:26:46 +0100")
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364113606-20836-23-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877gkxkl5l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Some packages are hosted on https:// servers, and wget only works on
 Thomas> these if the SSL certificates are installed. For example, downloading
 Thomas> the kernel sources from kernel.org requires those SSL certificates to
 Thomas> be installed.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  support/dependencies/dependencies.sh |    9 +++++++++
 Thomas>  1 file changed, 9 insertions(+)

 Thomas> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
 Thomas> index 5fb4c19..9ee63b5 100755
 Thomas> --- a/support/dependencies/dependencies.sh
 Thomas> +++ b/support/dependencies/dependencies.sh
 Thomas> @@ -199,4 +199,13 @@ if ! perl  -e "require Data::Dumper" > /dev/null 2>&1 ; then
 Thomas>      /bin/echo -e "Your Perl installation is not complete enough, at least Data::Dumper is missing."
 Thomas>      /bin/echo -e "On Debian/Ubuntu distributions, install the 'perl' package."
 Thomas>      exit 1
 Thomas> +fi
 Thomas> +
 Thomas> +# Check that we have the SSL certificates to make https:// downloads
 Thomas> +# work.
 Thomas> +if ! test -d /etc/ssl/certs; then

I don't know if all distributions install them here, hopefully they do.

 Thomas> +    /bin/echo -e "Your system lacks Common CA certificates for SSL."
 Thomas> +    /bin/echo -e "This prevents https:// downloads from suceeding."

s/suceeding/succeeding/

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
