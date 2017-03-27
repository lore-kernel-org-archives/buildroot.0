From: =?utf-8?Q?=C3=89tienne_Ph=C3=A9lip?= <etienne.phelip@savoirfairelinux.com>
Date: Mon, 27 Mar 2017 17:06:55 -0400 (EDT)
Subject: [Buildroot] [PATCH 1/2] support/scripts: add generic genimage
 script
In-Reply-To: <2b9a89f7-a56a-1b20-4b84-7952978203b5@mind.be>
References: <20170327164730.16271-1-etienne.phelip@savoirfairelinux.com>
 <20170327164730.16271-2-etienne.phelip@savoirfairelinux.com>
 <2b9a89f7-a56a-1b20-4b84-7952978203b5@mind.be>
Message-ID: <1486967858.369675.1490648815951.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout!

----- Le 27 Mar 17, ? 16:40, Arnout Vandecappelle arnout at mind.be a ?crit :

> Hi Phelip,
> 
> Nice to see yet another contribution from Savoir-faire!
> 
> On 27-03-17 18:47, Phelip Etienne wrote:
>> This script is a wrapper for the genimage tool used by most boards.
>> The board postimage script can now call this script instead of invoking
>> genimage command themselves.
> 
> Looks good except for some small comments below. It would have been nice,
> however, if you had included a patch in this series that completely removes one
> of the post-image scripts. Almost all of them can be removed completely,
> raspberrypi is one of the exceptions...

Good, since you seem to agree with the proposed changes, I will respin
a new patch series addressing your comments, as well as applying the
change to all other boards using genimage.

In the meantime, I plan to add a Kconfig entry to specify a list of
space separated genimage config files and make Buildroot call the
wrapper automatically (after the post-image script), for each config
file. Do you think I should add this Kconfig/Makefile addition
in a future series, or directly in this one?

Thanks,
--Etienne
