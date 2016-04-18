From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Apr 2016 01:57:12 +0200
Subject: [Buildroot] [PATCH] Adding in support for custom configurations
In-Reply-To: <20160418214442.GB19968@asimov.austin.ibm.com>
References: <1460734834-32123-1-git-send-email-patrick@stwcx.xyz>
 <20160417223143.0b54cce6@free-electrons.com>
 <20160418162528.GA5827@asimov.austin.ibm.com>
 <20160418211558.12db7fdf@free-electrons.com>
 <20160418214442.GB19968@asimov.austin.ibm.com>
Message-ID: <57157458.7080802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/18/16 23:44, Patrick Williams wrote:
> On Mon, Apr 18, 2016 at 09:15:58PM +0200, Thomas Petazzoni wrote:
>> >Hello,
>> >
>> >On Mon, 18 Apr 2016 11:25:28 -0500, Patrick Williams wrote:
>> >
>>> > >1. Have support for a defconfig location other than
>>> > >$(BR2_EXTERNAL)/configs/.
>>> > >
>>> > >     We have the proposed patchset, which is too specific due to the use
>>> > >     of 'custom', and we have a local hack where we put the same recipe
>>> > >     into $(BR2_EXTERNAL)/docs/custom/custom.mk. Other than docs/*/*.mk,
>>> > >     there is no include in buildroot/Makefile into the BR2_EXTERNAL tree
>>> > >     when invoked without an existing .config.
>>> > >
>>> > >     Would there be opposition to a new -include in buildroot/Makefile
>>> > >     outside of the large $(if BR2_HAVE_DOT_CONFIG... block into the
>>> > >     BR2_EXTERNAL tree?  This would give us a hook point to add the
>>> > >     %_defconfig recipe found in this patchset.
>>> > >
>>> > >     Alternatively, or additionally, we could create a
>>> > >     BR2_EXTERNAL_CONFIGS variable as a set of additional directories to
>>> > >     search as defconfig locations.
>>> > >
>>> > >2. (Bonus) Enhance list-defconfigs to also display the defconfigs found
>>> > >at this extra location.
>>> > >
>>> > >     Would there be opposition to something like a
>>> > >     $(BR2_LIST_DEFCONFIGS_CMDS) variable to extend the list-defconfigs
>>> > >     in the custom tree?
>> >
>> >I think the only reasonable solution to this is to really allow
>> >multiple BR2_EXTERNAL directories. A patch series doing this was
>> >proposed by Yann E. Morin a while ago, but due to the fairly
>> >significant additional complexity, it hasn't been merged so far.
> Has there been any previous discussion about allowing sub-directories
> under 'configs'?  The Linux kernel tree allows both
> $(ARCH)/configs/*_defconfig and $(ARCH)/configs/*/*_defconfig .  Coupled
> with Steve's proposal for us to use symlinks, we could create
> $(BR2_EXTERNAL)/configs/custom as a symlink to
> $(BR2_EXTERNAL)/custom/configs and have a solution as well.
>

  If that doesn't add too much complexity (and I can't imagine it does), it 
could definitely be a good solution. Especially if that allows us to kill the 
idea of a multi-layered-without-calling-it-layers BR2_EXTERNAL :-)

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
