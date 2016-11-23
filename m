From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 23 Nov 2016 12:15:47 +0100
Subject: [Buildroot] [PATCH v3 01/18] reproducibility: generate
	SOURCE_DATE_EPOCH
In-Reply-To: <1479899298-14655-2-git-send-email-jezz@sysmic.org>
References: <1479899298-14655-1-git-send-email-jezz@sysmic.org>
 <1479899298-14655-2-git-send-email-jezz@sysmic.org>
Message-ID: <1645066.dhnnC90b56@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wednesday 23 November 2016 12:08:01 J?r?me Pouiller wrote:
[...]
> +SOURCE_DATE_GIT = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
> +export SOURCE_DATE_EPOCH = $(if $(wildcard $(TOPDIR)/.git),$(SOURCE_DATE_GIT),$(BR2_VERSION_EPOCH))
>  endif
Arf, I have forgotten a fixup that do s/SOURCE_DATE_GIT/BR2_VERSION_GIT_EPOCH/.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
