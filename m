From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 14:47:55 +0200
Subject: [Buildroot] [PATCH v2 1/1] bird: new package
In-Reply-To: <20180927222100.6564-1-adrien@gallouet.fr>
References: <20180927204116.29484-1-adrien@gallouet.fr>
 <20180927222100.6564-1-adrien@gallouet.fr>
Message-ID: <20181009144755.72bbd60c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adrien,

On Thu, 27 Sep 2018 22:21:01 +0000, Adrien Gallou?t wrote:
> The BIRD project aims to develop a dynamic IP routing daemon with full support
> of all modern routing protocols, easy to use configuration interface and
> powerful route filtering language
> 
> Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
> ---
> Changes v1 -> v2 (after Baruch Siach review)
> - Add a comment for the use of autoreconf
> - Use github helper

I've applied your patch, after doing a number of changes:

    [Thomas:
     - Do not make ncurses/readline mandatory dependencies, since they are
       not. They are only needed when building the BIRD client. Added a
       Config.in sub-option to enable/disable the client. As part of this,
       added ncurses/readline to <pkg>_DEPENDENCIES.
     - Add a patch to fix the installation when the BIRD client is
       disabled, the patch has been submitted upstream.
     - Added host-flex and host-bison to <pkg>_DEPENDENCIES since
       flex/bison are used during the build process.
     - Add BR2_USE_MMU dependency, the code uses fork()
     - Fix alphabetic ordering in DEVELOPERS file.]

Thanks for this contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
