From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Jan 2019 22:07:09 +0100
Subject: [Buildroot] [PATCH 01/11] support/download: fix scp downloads
In-Reply-To: <20190103204026.23512-2-patrickdepinguin@gmail.com>
References: <20190103204026.23512-1-patrickdepinguin@gmail.com>
 <20190103204026.23512-2-patrickdepinguin@gmail.com>
Message-ID: <20190103220709.72d2cda3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 Jan 2019 21:40:16 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> scp download is broken, because scp is called without filename argument and
> only the server is specified. The call is:
>     scp <server> <outputfile>
> 
> but should be:
>     scp <server>/<filename> <outputfile>
> 
> Instead of assuming '-u' lists a full URL including filename (which it is
> not), align with the wget helper where -u is the server URL and -f gives the
> filename.
> 
> With this commit, an scp download can work if FOO_SITE_METHOD is explicitly
> set to 'scp' and the server does not have a scheme prefix 'scp://'.
> The next commit will handle the case where a scheme prefix is present.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  support/download/scp | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master after s/URL/URI/ in the comment, as suggested by Yann.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
