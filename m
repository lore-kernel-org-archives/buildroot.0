From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 9 Jun 2010 05:58:39 +0300
Subject: [Buildroot] How to set file ownership prior to JFFS2 root
 filesystem generation
In-Reply-To: <8128F0FD6C26E14C8EB4BFDB92B8D6B201517E08@2putt.int.lantronix.com>
References: <8128F0FD6C26E14C8EB4BFDB92B8D6B201517E08@2putt.int.lantronix.com>
Message-ID: <20100609025839.GE2318@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

On Tue, Jun 08, 2010 at 03:36:36PM -0700, Matthew Davison wrote:
> I would like to create a home directory on the target and set its
> ownership to the uid of a user that will also be present on the target.
> I've noticed that something like this is already happening for the
> /home/default directory, but I have been unable to determine how. In
> general, how do you set the ownership of a file prior to JFFS2 root
> filesystem generation?

To tweak ownership and permission of files and directories in the generated 
filesystem you need to edit the relevant device_table file. For the generic 
filesystem this is (currently) target/generic/device_table.txt.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
