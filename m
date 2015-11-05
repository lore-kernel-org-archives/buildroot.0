From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 22:37:23 +0100
Subject: [Buildroot] [PATCH v2 2/3] gpsd: cleanup udev rule permissions
In-Reply-To: <1446748914-12628-2-git-send-email-james.knight@rockwellcollins.com>
References: <1446748914-12628-1-git-send-email-james.knight@rockwellcollins.com>
 <1446748914-12628-2-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20151105223723.35e5069e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Thu,  5 Nov 2015 13:41:53 -0500, James Knight wrote:
> Adjust a generated udev rule file (25-gpsd.rules) to have user write
> permissions. This is to prevent rebuild issues when the gpsd package
> fails to re-install on a target (since the `cp` of the rule file will
> fail due to permissions).
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
> Changes v1 -> v2:
>   - Package change introduced in change set 2.
> ---
>  package/gpsd/gpsd.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied after doing some minor tweaks to the commit title and the
comment in the code.

Could you report this issue to upstream gpsd? It is not normal IMO that
a projects doesn't support "make install; make install".

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
