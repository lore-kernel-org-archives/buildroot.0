From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 23:26:43 +0100
Subject: [Buildroot] [PATCH 0/3] Cleanup trailing slashed from FOO_SITE
In-Reply-To: <1425939292-14719-1-git-send-email-luca@lucaceresoli.net>
References: <1425939292-14719-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20150309232643.7c1e9495@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Mon,  9 Mar 2015 23:14:49 +0100, Luca Ceresoli wrote:

> Luca Ceresoli (3):
>   manual: download: remove trailing slash from package FOO_SITE
>   Remove trailing slash from all package site URLs
>   Download: remove trailing slash cleanups for SITE URLs

Sounds good, but shouldn't we add a check to make sure that such
trailing slashes don't get added again? Like a check in pkg-generic.mk
that verifies that $($(2)_SITE) is the same as $($(2)_SITE:=/) ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
