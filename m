From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 8 Feb 2007 18:49:55 +0100
Subject: [Buildroot] First Step in allowing Static / shared library
	choice
In-Reply-To: <20070208174308.GB9196@aon.at>
References: <8867285.post@talk.nabble.com> <20070208172318.GA8945@aon.at>
	<8870245.post@talk.nabble.com> <20070208174308.GB9196@aon.at>
Message-ID: <20070208174955.GC9196@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 08, 2007 at 06:43:08PM +0100, Bernhard Fischer wrote:
>On Thu, Feb 08, 2007 at 09:39:28AM -0800, Daniel Laird wrote:
>>
>>
>>
>>Bernhard Fischer-6 wrote:
>>> 
>>> On Thu, Feb 08, 2007 at 07:18:08AM -0800, Daniel Laird wrote:
>>>>
>>>>Following on from my question of 'how do we deal with shared and static
>>>>builds"
>>>>I enclose the following patch.
>>>>This is for the top level Config.in
>>>>It will appear under Build options
>>>>this means that the variables BR2_STATIC_LIBS and BR2_SHARED_LIBS are
>>>>available.
>>>>
>>>>Once this patch is in we can start to modify packages to use this
>>>>information. (no packages modified yet)
>>> 
>>> Sounds good.
>>> 
>>> Can you please also add $(BR2_ENABLE_SHARED) rsp. $(BR2_ENABLE_STATIC)
>>> variables (and the corresponding DISABLE) that get passed to
>>> TARGET_CONFIGURE_OPTS (spelling?) to toolchain/Makefile.in or an
>>> appropriate place?
>>> 
>>> TIA,
>
>>I agree that I could do this.  However I  decided that you might want the
>>toolchain to be built staticly but your packages not.
>>I could therefore add a separate set of options to Toolchain options 
>>maybe BR2_TOOLCHAIN_STATIC_LIBS etc as i think these options should be
>>different to the package options
>>what do you think
>
>TARGET_CONFIGURE_OPTS get _only_ passed to target packages, be they
>you-name-it package or a native compiler. Distinguishing between a
>native compiler with shared lib support and the rest of the system being
>static (and likely not having ld support due to this) doesn't sound like
>we want to have it for a first take, ok?

Those have to be called TARGET_CONFIGURE_FLAGS, of course, and we'll have
to pass them to all ./configure invocations.. manually. hmz. At least we
can at the same time move DISABLE_NLS and DISABLE_LARGEFILE into these
TARGET_CONFIGURE_FLAGS, so this isn't too bad.
