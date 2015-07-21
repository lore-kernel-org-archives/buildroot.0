From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jul 2015 21:54:38 +0200
Subject: [Buildroot] [PATCH] snmppp: extract license text from source
 files
In-Reply-To: <1437496184-26203-1-git-send-email-luca@lucaceresoli.net>
References: <1437496184-26203-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20150721215438.19389da8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Tue, 21 Jul 2015 18:29:44 +0200, Luca Ceresoli wrote:
> There is no proper license file in the SNMP++ tarballs, so let's
> extract it from a source file instead of copying it entirely.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  package/snmppp/snmppp.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

In many other packages we are using a complete source file as the
license text. Should we switch to the solution you're proposing instead?
Another possibility is to do:

<pkg>_LICENSE_FILES = src/v3.cpp:1:50

To tell the package infra to extract the text from lines 1 to 50. But
we would never notice when the lines no longer match.

I'd like to have a general agreement on this before going further with
your patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
