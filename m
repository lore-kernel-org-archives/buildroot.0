From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Nov 2017 08:59:50 +0100
Subject: [Buildroot] [PATCH 8/8] gitlab-ci: run check-package
In-Reply-To: <b9a9596c19817cf5a70c17acaa23657ed3597f01.1511996903.git.yann.morin.1998@free.fr>
References: <cover.1511996903.git.yann.morin.1998@free.fr>
 <b9a9596c19817cf5a70c17acaa23657ed3597f01.1511996903.git.yann.morin.1998@free.fr>
Message-ID: <20171130085950.0dc9a144@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Nov 2017 00:08:45 +0100, Yann E. MORIN wrote:

> +check-package:
> +    script:
> +        - find . -type f -name '*.mk' -exec ./utils/check-package {} +

Does it run without warning on all .mk files?

In fact, I think we shouldn't limit it to .mk files, because
check-package can also verify Config.in files and .hash files.

Perhaps:

  find package/ boot/ linux/ -type f -exec ./utils/check-package {}

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
