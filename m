From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Jun 2017 20:02:37 +0200
Subject: [Buildroot] [PATCH] .gitlab-ci.yml: add check-DEVELOPERS test
In-Reply-To: <20170630164253.19859-1-arnout@mind.be>
References: <20170630164253.19859-1-arnout@mind.be>
Message-ID: <20170630200237.1378f5dd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Jun 2017 18:42:53 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

> +check-DEVELOPERS:
> +    script:
> +        - PYTHONPATH=$PWD/support/scripts
> +                python -c 'from getdeveloperlib import parse_developers; parse_developers()' |
> +                grep . && exit 1

Isn't "./support/scripts/get-developer -c" doing the right thing?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
