From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jun 2014 14:34:31 +0200
Subject: [Buildroot] [PATCHv2 2/2] glibc: add eglibc 2.19-svnr25243 and
 choice menu
In-Reply-To: <1401623919-16671-2-git-send-email-gustavo@zacarias.com.ar>
References: <1401623919-16671-1-git-send-email-gustavo@zacarias.com.ar>
 <1401623919-16671-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140601143431.683da18d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun,  1 Jun 2014 08:58:39 -0300, Gustavo Zacarias wrote:

> +config BR2_EGLIBC_VERSION_2_19
> +	bool "2.19-svnr25243"
> +	depends on !BR2_powerpc_SPE

I'd like to see a comment above this dependency that explains why we
have this dependency: it's not because there is no support for PowerPC
SPE, but only because it's broken, so a future bump to a newer version
of eglibc 2.19 might fix the problem.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
