From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Apr 2019 09:14:43 +0200
Subject: [Buildroot] [PATCH] package/python-urllib3: security bump to
 version 1.24.2
In-Reply-To: <20190425070722.19438-1-peter@korsgaard.com>
References: <20190425070722.19438-1-peter@korsgaard.com>
Message-ID: <20190426091443.067bef92@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 25 Apr 2019 09:07:22 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issue:
> 
> - CVE-2019-11324: The urllib3 library before 1.24.2 for Python mishandles
>   certain cases where the desired set of CA certificates is different from
>   the OS store of CA certificates, which results in SSL connections
>   succeeding in situations where a verification failure is the correct
>   outcome.  This is related to use of the ssl_context, ca_certs, or
>   ca_certs_dir argument.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/python-urllib3/python-urllib3.hash | 4 ++--
>  package/python-urllib3/python-urllib3.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
