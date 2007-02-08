From: Daniel Laird <danieljlaird@hotmail.com>
Date: Thu, 8 Feb 2007 09:39:28 -0800 (PST)
Subject: [Buildroot] First Step in allowing Static / shared library
 choice
In-Reply-To: <20070208172318.GA8945@aon.at>
References: <8867285.post@talk.nabble.com> <20070208172318.GA8945@aon.at>
Message-ID: <8870245.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




Bernhard Fischer-6 wrote:
> 
> On Thu, Feb 08, 2007 at 07:18:08AM -0800, Daniel Laird wrote:
>>
>>Following on from my question of 'how do we deal with shared and static
>>builds"
>>I enclose the following patch.
>>This is for the top level Config.in
>>It will appear under Build options
>>this means that the variables BR2_STATIC_LIBS and BR2_SHARED_LIBS are
>>available.
>>
>>Once this patch is in we can start to modify packages to use this
>>information. (no packages modified yet)
> 
> Sounds good.
> 
> Can you please also add $(BR2_ENABLE_SHARED) rsp. $(BR2_ENABLE_STATIC)
> variables (and the corresponding DISABLE) that get passed to
> TARGET_CONFIGURE_OPTS (spelling?) to toolchain/Makefile.in or an
> appropriate place?
> 
> TIA,
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
> 
I agree that I could do this.  However I  decided that you might want the
toolchain to be built staticly but your packages not.
I could therefore add a separate set of options to Toolchain options 
maybe BR2_TOOLCHAIN_STATIC_LIBS etc as i think these options should be
different to the package options
what do you think
Dan
-- 
View this message in context: http://www.nabble.com/First-Step-in-allowing-Static---shared-library-choice-tf3193891.html#a8870245
Sent from the BuildRoot mailing list archive at Nabble.com.
