From: Herve Codina <herve.codina@bootlin.com>
Date: Fri, 25 Jun 2021 10:04:35 +0200
Subject: [Buildroot] [PATCH 09/15] package/pkg-python: Remove
 _sysconfigdata*.pyc files when _sysconfigdata*.py are changed
In-Reply-To: <20210622205040.GM44262@scaer>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-10-herve.codina@bootlin.com>
 <20210621171202.2362cb27@windsurf>
 <20210622195211.4bafd222@bootlin.com>
 <20210622205040.GM44262@scaer>
Message-ID: <20210625100435.235682e4@fedora>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 22 Jun 2021 22:50:40 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> And 2: why not using find's -delete option to begin with:
> 
>     find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* \
>         -name "_sysconfigdata*.pyc" -delete
> 
> There, not even a pipe, or an exec of anything else...
> 

Yes, indeed.
I just didn't think about '-delete' when I wrote the "find ...".

Changed to '-delete' option.


Herv?

-- 
Herv? Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
