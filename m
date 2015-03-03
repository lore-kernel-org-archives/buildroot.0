From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Mar 2015 14:31:25 +0100
Subject: [Buildroot] [PATCH 1/1] Fix barebox compilation issue with
 64bit kernel
In-Reply-To: <1425385673-2462-1-git-send-email-fabienlahoudere.pro@gmail.com>
References: <1425385673-2462-1-git-send-email-fabienlahoudere.pro@gmail.com>
Message-ID: <20150303143125.75a1a4d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lahoudere Fabien,

On Tue,  3 Mar 2015 13:27:53 +0100, Lahoudere Fabien wrote:
> Signed-off-by: Lahoudere Fabien <fabienlahoudere.pro@gmail.com>

This should normally be:

	Signed-off-by: <first name> <last name> <email>

> ---
>  boot/barebox/barebox.mk | 2 ++
>  1 file changed, 2 insertions(+)

This looks good but the commit log could be improved:

	barebox: fix compilation on x86-64 architecture

	Barebox uses KERNEL_ARCH to derive BAREBOX_ARCH, but doesn't
	currently handle the case of the x86-64 architecture. In this
	case KERNEL_ARCH is x86_64, but BAREBOX_ARCH should be x86
	nonetheless.

The commit title should almost always look like:

	<pkg>: <description>

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
