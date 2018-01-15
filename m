From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jan 2018 15:41:43 +0100
Subject: [Buildroot] [PATCH 1/7] package/skeleton-init-common: add
 /bin/sh to /etc/shells
In-Reply-To: <1515963815-5843-2-git-send-email-romain.naour@smile.fr> (Romain
 Naour's message of "Sun, 14 Jan 2018 22:03:29 +0100")
References: <1515963815-5843-1-git-send-email-romain.naour@smile.fr>
 <1515963815-5843-2-git-send-email-romain.naour@smile.fr>
Message-ID: <87o9lvuqu0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Add the default shell /bin/sh to /etc/shells only if BR2_SYSTEM_BIN_SH_NONE
 > is not selected.

 > Add an empty /etc/shells in the rootfs skeleton.

Is there any specific reason to have an empty /etc/shells?

It is a bit noisy to have this extra file in the BIN_SH_NONE case, and
it afaik changes behaviour (E.G. getusershell() will return default
values if there is no /etc/shells, but will now presumably return the
empty string).

-- 
Bye, Peter Korsgaard
