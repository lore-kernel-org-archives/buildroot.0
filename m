From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 8 Mar 2019 09:35:10 +0100
Subject: [Buildroot] [PATCH v2] package/optee-client: fix build warnings
 from 3.4.0
In-Reply-To: <1552032472-10717-1-git-send-email-etienne.carriere@linaro.org>
References: <1552032472-10717-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <20190308093510.05b72f71@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  8 Mar 2019 09:07:52 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> +-	arg = (struct tee_ioctl_open_session_arg *)buf;
> ++	arg = (struct tee_ioctl_open_session_arg *)(void *)buf;

This looks a bit weird. And indeed in the review of the pull request
you made upstream, they also express some doubts about this solution,
which just papers over the problem.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
