From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 21:02:38 +0200
Subject: [Buildroot] [PATCH 1/3] package/bash: use --bindir instead of
 exec_prefix=
In-Reply-To: <20210423202356.37681-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 23 Apr 2021 22:23:53 +0200")
References: <20210423202356.37681-1-thomas.petazzoni@bootlin.com>
Message-ID: <87v988hnsh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > We want bash to be installed as /bin/bash. For ages, Buildroot has
 > been doing this by overriding exec_prefix at install time. First of
 > all, it would be preferred to do this at configure time. But also,
 > overriding exec_prefix not only changes where "bash" goes, but also
 > where the pkgconfig file goes. Due to this, bash.pc goes into
 > /lib/pkgconfig/, and doesn't get removed by target-finalize.

 > Since all we want is to have 'bash' as /bin/bash, simply pass
 > --bindir=/bin at configure time. This allows to use the default target
 > installation logic for autotools-package. We keep a post-install
 > target hook to remove /bin/bashbug.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
