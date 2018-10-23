From: Nasser Afshin <afshin.nasser@gmail.com>
Date: Tue, 23 Oct 2018 18:49:02 +0330
Subject: [Buildroot] [PATCH] merge_config.sh: Fix finding redundant
 config mechanism
In-Reply-To: <7189ed78-6481-0290-f13b-88e3c1008937@mind.be>
References: <1539989903-19803-1-git-send-email-Afshin.Nasser@gmail.com>
 <CANQCQpaxMvn2OEfP0aztbFRk0KTOTnt8nugZ-gwKL7oML1eQUw@mail.gmail.com>
 <7189ed78-6481-0290-f13b-88e3c1008937@mind.be>
Message-ID: <20181023151902.GA18148@smart-All-Series>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sat, Oct 20, 2018 at 05:01:33PM +0100, Arnout Vandecappelle wrote:
> 
> 
> On 20/10/2018 15:56, Matthew Weber wrote:
> > Nasser,
> > 
> > On Fri, Oct 19, 2018 at 11:58 PM Nasser <afshin.nasser@gmail.com> wrote:
> >>
> >> We use BR2_* style for configuration variables in buildroot so we should
> >> use this style when extracting configuration options. Otherwise CFG_LIST
> >> will almost always be empty.
> >>
> >> The CONFIG_* style has been taken form the Linux kernel and is not
> >> appropriate in this context.
> 
>  A similar patch was actually submitted earlier by Angelo [1]. I commented on
> that that it should be simplified like you propose. However...
> 
> >>
> > 
> > The merge_config.sh is used for a couple scenarios
> >  - Appending kconfigs together (CONFIG_*)
> 
>  ... I forgot about this one. Indeed, the buildroot merge_config.sh script is
> used in pkg-kconfig.mk to merge kernel configs. Ideally we should change that to
> use the package's merge_config.sh script. However, the location of that script
> may vary, or it may even be missing...
> 
> >  - Buildroot cfgs for runtime tests (BR2_*)
> >  - As a tool by users to merge together Buildroot configs
> > 
> > I'm not sure of the cleanest approach to support both
> >  - you could detect if the file is one or the other and adjust the regex
> >  - do the inverse and build a list of lines that are not comments
> 
>  I think Angelo's patch is the best approach after all.

I agree with you. The -b switch can be used to have a general solution
for both cases.

> 
>  However, there is one comment that I made on Angelo's patch that still applies
> here:
> 
>  Since the kconfig stuff comes from upstream but is modified, we also maintain
> the changes as a stack of patches in support/kconfig/patches. So you should
> generate a new patch for this change and add it to the series file. I'm not sure
> why we don't use a vendor branch and just merge, but that's the way we do it :-).
> 
> 
>  Also, Nasser, we require your Signed-off-by to contain your full name. The
> Signed-off-by is a short way for you to assert that you are entitled to
> contribute the patch under buildroot's GPL license.  See
> http://elinux.org/Developer_Certificate_Of_Origin for more details. Itis an
> official statement, so it should be done with your full and real name. And
> please make sure that the author information matches the Signed-off-by.

Sorry, this was a miss-configuration on the machine I've used to send the
patch. I'll correct my Signed-off-by clause.

Should I resend the patch applying Angelo -b approach?
> 
> 
>  Regards,
>  Arnout
> 
> [1] http://patchwork.ozlabs.org/patch/824051/
> 

Regards,
Nasser Afshin
