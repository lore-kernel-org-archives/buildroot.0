From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 14:56:29 +0200
Subject: [Buildroot] [PATCH] stunnel: bump to version 5.16
In-Reply-To: <1429790551-7950-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429790551-7950-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150423145629.6a75c166@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 23 Apr 2015 09:02:31 -0300, Gustavo Zacarias wrote:

> +STUNNEL_CONF_ENV = ax_cv_check_cflags___fstack_protector=no

Shouldn't this be:

STUNNEL_CONF_ENV = \
	ax_cv_check_cflags___fstack_protector=$(if $(BR2_ENABLE_SSP),yes,no)

 ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
