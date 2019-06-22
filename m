From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 20:49:57 +0200
Subject: [Buildroot] [PATCH v2 1/3] autobuild-run: create reason file on
 build failures
In-Reply-To: <20190622184118.5627-1-itsatharva@gmail.com>
References: <20190622184118.5627-1-itsatharva@gmail.com>
Message-ID: <20190622204957.587b1635@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Atharva,

Thanks for the second iteration. One question below.

On Sun, 23 Jun 2019 00:11:16 +0530
Atharva Lele <itsatharva@gmail.com> wrote:

> +        reason = get_failure_reason()
> +        if reason:
> +            with open(os.path.join(self.resultdir, "reason"), "w+") as reasonf:
> +                reasonf.write("-".join(reason))

Why do we have this "-".join(reason) instead of just writing the
contents of the "reason" variable to the file ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
