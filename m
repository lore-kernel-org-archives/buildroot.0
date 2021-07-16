From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:30:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-urllib3: security bump
 to version 1.26.6
In-Reply-To: <20210705211453.3518832-1-fontaine.fabrice@gmail.com>
References: <20210705211453.3518832-1-fontaine.fabrice@gmail.com>
Message-ID: <20210716233038.33ad3822@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon,  5 Jul 2021 23:14:53 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2021-33503: An issue was discovered in urllib3 before 1.26.5.
> When provided with a URL containing many @ characters in the authority
> component, the authority regular expression exhibits catastrophic
> backtracking, causing a denial of service if a URL were passed as a
> parameter or redirected to via an HTTP redirect.
> 
> https://github.com/urllib3/urllib3/blob/1.26.6/CHANGES.rst
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
