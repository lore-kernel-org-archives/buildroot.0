From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 15 Feb 2012 07:58:51 +0100
Subject: [Buildroot] [PATCH] build: add 'file' option for 'make
	defconfig'
In-Reply-To: <201202141453.23995.arnout@mind.be>
References: <1328918596-19369-1-git-send-email-felipe.contreras@gmail.com>
 <CAAXf6LVPo6hWwJFUm3dzFYPAVvC=_=aBP1B7XSQ26spoyuEYFA@mail.gmail.com>
 <CAMP44s2yuoJ38UdeaRbgeLo9QvPDgrv1roPzgjKL-QZdt7W54g@mail.gmail.com>
 <201202141453.23995.arnout@mind.be>
Message-ID: <CAAXf6LWX1GYtHYCQzaaohgDg2NM=cZMoDErcNBv-w4NNC-hrtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 14, 2012 at 2:53 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Tuesday 14 February 2012 13:44:03 Felipe Contreras wrote:
>
>> > If one creates a defconfig file, why not store it in 'configs' ?
>
>>
>
>> Because it's personal.
>
>>
>
>> I want to be able to clone buildroot, and 'make defconfig
>
>> file=/media/drive/notes/my-buildroot-config'.
>
>
> Same here.

Ok, I see. I have been used to having my own repository for buildroot
and didn't think of people who just download a tarball each time.

>
>
> BTW, regarding the naming: eventually I'd like to include BR2_DEFCONFIG
>
> in the .config, which gets qstripped to DEFCONFIG in the Makefile. This can
>
> be used to be able to store the config again, similar to
> linux-update-defconfig.

I once proposed a patch that did something similar:
http://lists.busybox.net/pipermail/buildroot/2011-February/041626.html

It would automatically save the last used 'defconfig' instead of
requiring an explicit 'file' option.


Being able to do 'make savedefconfig file=...' would also be nice.

Best regards,
Thomas
