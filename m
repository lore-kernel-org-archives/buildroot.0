From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Nov 2013 22:59:03 +0100
Subject: [Buildroot] [PATCH] gcc: don't patch gcc if there are no
	patches to apply
In-Reply-To: <1384180596-15125-1-git-send-email-mjonker@synopsys.com> (Mischa
 Jonker's message of "Mon, 11 Nov 2013 15:36:36 +0100")
References: <1384180596-15125-1-git-send-email-mjonker@synopsys.com>
Message-ID: <87d2m661nc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mischa" == Mischa Jonker <Mischa.Jonker@synopsys.com> writes:

> While the generic package handler checks for a directory with patches
> before starting apply-patches.sh, this is not the case for gcc: the
> script is called, even if there is no directory with patches. This results
> into a build failure, as apply-patches exits with error code 1 if the
> directory doesn't exist.

Arnout already posted another patch solving the same issue, but I prefer
this one for 2013.11 - So committed, thanks.

-- 
Bye, Peter Korsgaard
