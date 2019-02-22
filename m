From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 22 Feb 2019 09:53:18 +0100
Subject: [Buildroot] [PATCH 1/1] boot/barebox: add renaming
 functionality to barebox image copy
In-Reply-To: <20190222094056.5f155e17@windsurf>
References: <2748BB04F99E7E45A3203C831E8B20FE34D35E84@SERBE4I2.intra.erbe-med.de>
 <20190222094056.5f155e17@windsurf>
Message-ID: <ef5bbef6-02e5-7c44-bec1-f65896df581f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/02/2019 09:40, Thomas Petazzoni wrote:
> Hello Markus,
> 
> On Tue, 19 Feb 2019 11:03:52 +0000
> "Steinhilber, Markus" <Markus.Steinhilber@erbe-med.com> wrote:

[snip]
>>>> Also, you need to rename the images in a post-build script if you
>>>> need certain file names.  
>>> That is a pretty normal thing in Buildroot. We just install things
>>> as they are installed by the upstream build system, and leave it up
>>> to custom post-build script to further rename/move/adjust to match
>>> the specific requirements of the project/user.  
>>
>> I understand. In this case I see it as some kind of nice-to-have
>> function you can achieve. The main reason is the one above.
> 
> Then perhaps the more Buildroot-ish way of doing things would be to
> install the images build by the barebox package in a different location
> than the one installed by the barebox-aux package, like
> $(BINARIES_DIR)/barebox/ and $(BINARIES_DIR)/barebox-aux/. The
> downsides of this are:
> 
>  - We don't do this for other packages
> 
>  - It breaks backward compatibility.
> 
> Arnout, Peter, what do you think ? (See Markus original patch for the
> start of the discussion)

 I feel that the original patch is way too complicated for such a corner case.

 Indeed, this use case happens to (almost) work by chance because barebox and
barebox-aux are two different packages rather than one like for U-Boot. But if
you anyway have the luck of having such an option, I don't mind adding a little
bit extra to be able to make better use of it.

 Perhaps a possibility is to add a config option that prefixes the output name
with something? You'd still need to rename it in the post-build script (or, more
likely, handle that in the genimage.cfg file). But it does solve the
identical-name problem, it looks pretty simple, and it doesn't break anything.

 Regards,
 Arnout
