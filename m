From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 21:30:44 +0100
Subject: [Buildroot] [PATCH] samba4: security bump to version 4.6.11
In-Reply-To: <20171121224313.26215-1-peter@korsgaard.com>
References: <20171121224313.26215-1-peter@korsgaard.com>
Message-ID: <20171122213044.6590d8f4@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Nov 2017 23:43:13 +0100, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
>  - CVE-2017-14746:
>    All versions of Samba from 4.0.0 onwards are vulnerable to a use after
>    free vulnerability, where a malicious SMB1 request can be used to
>    control the contents of heap memory via a deallocated heap pointer. It
>    is possible this may be used to compromise the SMB server.
> 
>  - CVE-2017-15275:
>    All versions of Samba from 3.6.0 onwards are vulnerable to a heap
>    memory information leak, where server allocated heap memory may be
>    returned to the client without being cleared.
> 
>    There is no known vulnerability associated with this error, but
>    uncleared heap memory may contain previously used data that may help
>    an attacker compromise the server via other methods. Uncleared heap
>    memory may potentially contain password hashes or other high-value
>    data.
> 
> For more details, see the release notes:
> https://www.samba.org/samba/history/samba-4.6.11.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/samba4/samba4.hash | 2 +-
>  package/samba4/samba4.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
