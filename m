From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Feb 2013 12:23:23 +0100
Subject: [Buildroot] [PATCH v2] vim: Add post-install hook to remove
 documentation from target
In-Reply-To: <1360666299-3661-1-git-send-email-markos.chandras@gmail.com>
References: <1360666299-3661-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <20130212122323.276f018f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Tue, 12 Feb 2013 10:51:39 +0000, Markos Chandras wrote:
> From: Markos Chandras <markos.chandras@imgtec.com>
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

We often try to keep the define ... endef block within the ifneq
condition, since there is no reason for the VIM_REMOVE_DOCS variable to
be defined if it is useless. But it's not something that has been done
systematically in the entire code base (for example, the
VIM_INSTALL_RUNTIME_CMDS just above your patch, doesn't follow this
rule).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
