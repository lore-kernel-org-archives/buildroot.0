From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Sep 2017 22:22:38 +0200
Subject: [Buildroot] [PATCH] mtd-utils: add mtd test tools
In-Reply-To: <20170814202150.24413-1-miquel.raynal@free-electrons.com>
References: <20170814202150.24413-1-miquel.raynal@free-electrons.com>
Message-ID: <463d2a1e-7a1e-789f-8644-4fbee9a6ce35@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-08-17 22:21, Miquel Raynal wrote:
> Add the possibility to choose more test tools than only integck
> from the MTD utils test-suite.
> 
> Move the hidden BR2_PACKAGE_MTD_TESTS configuration to the bottom
> of the page and make it visible. When checked, a new list of available
> binaries is displayed and may be selected and compiled into the image
> with the --enable-install-tests configure script option:
> - flash_torture
> - flash_stress
> - flash_speed
> - nandbiterrs
> - flash_readtest
> - nandpagetest
> - nandsubpagetest
> 
> Most of these tests may be performed by inserting kernel modules
> which are almost legacy so having the userspace tools available
> might become useful.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>

 Applied to master, after a few changes:

     - fix threads and MMU dependency (due to a change introduced after you
submitted this patch);
     - order Config.in options and mtd.mk lines alphabetically;
     - add note on legacy handling to commit message.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
